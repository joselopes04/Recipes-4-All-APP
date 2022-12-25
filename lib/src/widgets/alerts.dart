import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

//User Management
import '../userManagement/auth.dart';

//Widgets
import 'package:Recipes_app/src/widgets/buttons.dart';
import 'package:Recipes_app/src/widgets/textInputs.dart';

//Terms and Conditions
void showTerms(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: ListView(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Terms and conditions",
                        style: bigTitleStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "\nBy downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. \n \n You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. \n\n You’re not allowed to attempt to extract the source code of the app, and you also shouldn't try to translate the app into other languages or make derivative versions. \n\n The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to José Lopes.\n\n"
                        "José Lopes is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.\n \n"
                        "The Recipes 4 All app stores and processes personal data that you have provided to us, to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Recipes 4 All app won’t work properly or at all."
                        "The app does use third-party services that declare their Terms and Conditions."
                        "Link to Terms and Conditions of third-party service providers used by the app:  \n\n"
                        "Google Play Services, \n"
                        "AdMob, \n"
                        "Google Analytics for Firebase, \n"
                        "Firebase Crashlytics"
                        "\n \nYou should be aware that there are certain things that José Lopes will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi or provided by your mobile network provider, but José Lopes cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left."
                        "If you’re using the app outside of an area with Wi-Fi, you should remember that the terms of the agreement with your mobile network provider will still apply."
                        "\n \n As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third-party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app."
                        "Along the same lines, José Lopes cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, José Lopes cannot accept responsibility."
                        "\n \nWith respect to José Lopes’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavor to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. José Lopes accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app."
                        "At some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for the both systems(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app.\n \n José Lopes does not promise that it will always update the app so that it is relevant to you and/or works with the Android & iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.\n\n"
                        "Changes to this Terms and Conditions \n"
                        "I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page. \n\n"
                        "These terms and conditions are effective as of 2022-09-14\n\n",
                        style: smallTextStyle,
                        textAlign: TextAlign.left,
                      ),
                      BasicButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        text: 'Close',
                        isActive: true,
                      ),
                    ],
                  ),
                ),
              ],
            ));
      });
}

void showResetPasswordMsg(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: AssetImage('assets/images/reset-password.png'),
                  width: 130.0,
                  height: 130.0,
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Text('Check your email.', style: bigTitleStyle),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 30.0, left: 15.0, right: 15.0),
                  child: Text(
                      "We've sent an email with a link to reset your password.",
                      style: blackDescriptionTextStyle),
                ),
                BasicButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  text: 'Done',
                  isActive: true,
                ),
              ],
            ),
          ),
        );
      });
}

void showReAuthentication(BuildContext context) {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Re-Authentication', style: bigTitleStyle),
                    SizedBox(height: 10.0),
                    Text('You need to Re-Authentication',
                        style: titleMinimizedRecipeStyle),
                    SizedBox(height: 20.0),
                    emailInput(controllerEmail, colorInputBG, true),
                    SizedBox(height: 25.0),
                    passwordInput(controllerPassword, colorInputBG, true),
                    SizedBox(height: 20.0),
                    BasicButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Re-Authentication',
                      isActive: true,
                    ),
                  ],
                ),
              ),
            ));
      });
}

Future<String?> showDifficulties(BuildContext context) async {
  String? option = "Difficulty";
  await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select the difficulty'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                option = "Easy";
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(Icons.cake, size: 40.0, color: colorIcons),
                  Text("Easy"),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                option = "Medium";
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(Icons.cookie, size: 40.0, color: colorIcons),
                  Text("Medium"),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                option = "Hard";
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(Icons.wine_bar, size: 40.0, color: colorIcons),
                  Text("Hard"),
                ],
              ),
            ),
          ],
        );
      });
  return option;
}

Future<String> showServings(BuildContext context, String? servings) async {
  final _formKey = GlobalKey<FormState>();
  bool isActive = false;
  if(servings=="Servings"){
    servings = "0";
  }
    TextEditingController controllerServings = TextEditingController(text:servings);

  await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                controllerServings.addListener(() {
                  if (_formKey.currentState!.validate()) {
                    setState(() => isActive = true);
                  } else {
                    setState(() => isActive = false);
                  }
                });
                return Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Servings', style: bigTitleStyle),
                        SizedBox(height: 20.0),
                        servingsTextField(controllerServings),
                        SizedBox(height: 20.0),
                        BasicButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Confirm',
                          isActive: isActive,
                        ),
                      ],
                    ),
                  ),
                );
              })),
          onWillPop: () {
            return Future.value(false);
          },
        );
      });
  return controllerServings.text;
}
