import 'dart:io';
import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_storage/firebase_storage.dart';

//Styles
import 'package:Recipes_app/src/styles/styles.dart';

//UserManagement
import 'package:Recipes_app/src/userManagement/auth.dart';

//Widgets
import 'package:Recipes_app/src/widgets/appBars.dart';
import 'package:Recipes_app/src/widgets/bottomNavigation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/buttons.dart';
import '../widgets/drawerMenu.dart';
import '../widgets/textInputs.dart';

//External Packages
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  File? image;
  bool enabled = false;

  //Pick profile picture
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //Save image on Firebase Storage
      final imageTemporary = File(image.path);
      final path = 'files/image${imageTemporary}'; //PATH

      final ref = FirebaseStorage.instance.ref().child(path); //REF

      ref.putFile(imageTemporary);

      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  bool? chageBool() {
    setState(() {
      if (enabled == false) {
        enabled = true;
      } else {
        enabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Auth _auth = Auth();
    String email = _auth.getEmail();
    String username = _auth.getUsername();

    TextEditingController controllerUsername =
        TextEditingController(text: username);
    TextEditingController controllerEmail = TextEditingController(text: email);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        //Action button doesn't move up
        drawer: const DrawerMenu(),
        backgroundColor: colorBG,
        floatingActionButton: FloatingActionButton(
          tooltip: "More options",
          backgroundColor: colorIcons,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text("Edit account"),
                          onTap: () {
                            chageBool();
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.lock),
                          title: Text("Reset Password"),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.delete),
                          title: Text("Delete account"),
                          onTap: () {},
                        )
                      ],
                    ));
          },
          child: Icon(Icons.more_vert),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: CustomScrollView(
          slivers: <Widget>[
            appBarOnlyTitle('My profile'),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          image != null
                              ? ClipOval(
                                  child: Image.file(image!,
                                      width: 115,
                                      height: 115,
                                      fit: BoxFit.cover))
                              : Icon(Icons.person,
                                  size: 115, color: colorWhite),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                      color: colorWhite,
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Center(
                                    child: IconButton(
                                      tooltip: "Change profile picture",
                                      onPressed: () async {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      leading: Icon(Icons.camera_alt_outlined),
                                                      title: Text("Camera"),
                                                      onTap: () async {
                                                        PermissionStatus cameraStatus = await Permission.camera.request();
                                                        if (cameraStatus == PermissionStatus.granted) {
                                                          Navigator.pop(context);
                                                          pickImage(ImageSource.camera);
                                                        }
                                                        if(cameraStatus == PermissionStatus.denied){
                                                          Fluttertoast.showToast(
                                                              msg: "We need this permission to access your camera",
                                                              toastLength: Toast.LENGTH_SHORT,
                                                              backgroundColor: colorWarningYellow,
                                                              gravity: ToastGravity.CENTER,
                                                              timeInSecForIosWeb: 1
                                                          );
                                                        }
                                                        if(cameraStatus == PermissionStatus.permanentlyDenied){
                                                          openAppSettings();
                                                        }
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading:
                                                          Icon(Icons.photo),
                                                      title: Text("Gallery"),
                                                      onTap: () async{
                                                        PermissionStatus galleryStatus = await Permission.storage.request();
                                                        if(galleryStatus == PermissionStatus.granted){
                                                          Navigator.pop(context);
                                                          pickImage(ImageSource.gallery);
                                                        }
                                                        if(galleryStatus == PermissionStatus.denied){
                                                          Fluttertoast.showToast(
                                                              msg: "We need this permission to access your gallery",
                                                              toastLength: Toast.LENGTH_LONG,
                                                              backgroundColor: colorWarningYellow,
                                                              gravity: ToastGravity.CENTER,
                                                              timeInSecForIosWeb: 2
                                                          );
                                                        }
                                                        if(galleryStatus == PermissionStatus.permanentlyDenied){
                                                          openAppSettings();
                                                        }

                                                      },
                                                    )
                                                  ],
                                                ));
                                        // pickImage();
                                      },
                                      iconSize: 30.0,
                                      icon: Icon(Icons.camera_alt_outlined),
                                    ),
                                  )))
                        ],
                      )),
                  SizedBox(height: 50),
                  usernameInput(controllerUsername, colorBG, enabled),
                  SizedBox(height: 20),
                  emailInput(controllerEmail, colorBG, enabled),
                  SizedBox(height: 50),
                  Visibility(
                    visible: enabled,
                    child: BasicButton(
                      onPressed: () async {
                        username = controllerUsername.text.toString();
                        email = controllerEmail.text.toString();
                        await _auth.updateUserInfo(context, username, email);
                        chageBool();
                      },
                      text: 'Save changes',
                    ),
                  ),
                  SizedBox(height: 50),
                  BasicButton(
                    onPressed: () {
                      Auth().signOut(context);
                    },
                    text: 'Log out',
                  ),
                ],
              )
            ]))
          ],
        ),
        bottomNavigationBar: bottomNavigation(context));
  }
}
