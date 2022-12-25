import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_auth/firebase_auth.dart';

//User Management
import '../userManagement/auth.dart';

//Styles
import '../styles/styles.dart';

//Widgets
import 'package:Recipes_app/src/widgets/buttons.dart';
import 'package:Recipes_app/src/widgets/textInputs.dart';
import '../widgets/alerts.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();

}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  TextEditingController controllerEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<void> sendPasswordResetEmail() async {
    try {
      await Auth().sendPasswordResetEmail(email: controllerEmail.text.trim());
      showResetPasswordMsg(context);
    }  on FirebaseAuthException catch (e) {
      //BUG: if the email is invalid this don't work idk why
      if (e.code == 'user-not-found') {
        SnackBar snackBar = SnackBar(
          content: Text('User not found'),
          backgroundColor: colorErrorRed,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
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
      body: Center(
          child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('Forgot password', style: bigTitleStyle),
                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          'Please enter your email address. You will receive a link to create a new password via email.',
                          style: smallTextStyle,
                          textAlign: TextAlign.center),
                    ),
                    emailInput(controllerEmail, colorInputBG, true),
                    SizedBox(height: 35.0),
                    BasicButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          sendPasswordResetEmail();
                        } else {

                        }

                      },
                      text: 'Reset password', isActive: true,
                    ),
                  ],
                ),
              ))),
    );
  }
}

