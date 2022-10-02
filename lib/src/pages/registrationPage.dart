import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_auth/firebase_auth.dart';

//Styles
import '../styles/styles.dart';

//Classes
import 'package:Recipes_app/src/userManagement/auth.dart';

//Widgets
import '../widgets/buttons.dart';
import '../widgets/textInputs.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  String? errorMessage = 'Error:';

  TextEditingController  controllerUsername = TextEditingController();
  TextEditingController  controllerEmail = TextEditingController();
  TextEditingController  controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async{
    try {
      await Auth().createUserWithEmailAndPassword(
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
      );
      Navigator.pushNamed(context, 'login');
    } on FirebaseAuthException catch (e) {
      setState((){
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return backButton(context, colorBlack);
            },
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              child: Center(
                child: Column(children: [
                  Text('Create an account', style: bigTitleStyle),
                  SizedBox(height: 30.0),
                  usernameInput(controllerUsername),
                  SizedBox(height: 25.0),
                  emailInput(controllerEmail),
                  SizedBox(height: 25.0),
                  passwordInput(controllerPassword),
                  SizedBox(height: 10.0),
                  Text("By clicking Sign Up you agree with our "),
                  GestureDetector(
                    onTap: () {
                      showAlert(context);
                    },
                    child: Text("Terms and conditions.", style: linksTextStyle),
                  ),
                  SizedBox(height: 20.0),
                  BasicButton(
                    onPressed: () {
                      createUserWithEmailAndPassword();
                    }, text: 'Sign Up',
                  ),
                ]),
              ),
            ),
          ],
        ));
  }

}

//Terms and Conditions
void showAlert(BuildContext context) {
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
                        }, text: 'Close',
                      ),
                    ],
                  ),
                ),
              ],
            ));
      });
}
