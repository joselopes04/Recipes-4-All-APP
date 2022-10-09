import 'dart:io';
import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_storage/firebase_storage.dart';

//Styles
import 'package:Recipes_app/src/styles/styles.dart';

//Widgets
import 'package:Recipes_app/src/widgets/appBars.dart';
import 'package:Recipes_app/src/widgets/bottomNavigation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../userManagement/auth.dart';
import '../widgets/buttons.dart';
import '../widgets/drawerMenu.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  File? image;

  Future<void> signOut() async {
    await Auth().signOut();
    Navigator.pushNamed(context, '/');
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: colorBG,
        body: CustomScrollView(
          slivers: <Widget>[
            appBar(context, 'My profile'),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: <Widget>[
                  SizedBox(height: 10),
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
                            child:Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(50.0)),
                              child: Center(
                                child:  IconButton(
                                  onPressed: () async{
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) => Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              leading: Icon(Icons.camera_alt_outlined),
                                              title: Text("Camera"),
                                              onTap: (){
                                                Navigator.pop(context);
                                                pickImage(ImageSource.camera);
                                              },
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.photo),
                                              title: Text("Gallery"),
                                              onTap: (){
                                                Navigator.pop(context);
                                                pickImage(ImageSource.gallery);

                                              },
                                            )
                                          ],
                                        )
                                    );
                                    // pickImage();
                                  },
                                  iconSize: 30.0,
                                  icon: Icon(Icons.camera_alt_outlined), ),
                              )
                            )
                          )
                        ],
                      )),
                  SizedBox(height: 100),
                  BasicButton(
                    onPressed: () {
                      signOut();
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
