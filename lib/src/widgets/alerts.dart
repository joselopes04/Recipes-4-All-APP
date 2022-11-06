import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

//User Management
import '../userManagement/auth.dart';

//Widgets
import 'package:Recipes_app/src/widgets/buttons.dart';
import 'package:Recipes_app/src/widgets/textInputs.dart';

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
                        String email = controllerEmail.text.trim();
                        String password = controllerPassword.text.trim();
                        _auth.reAuthenticateUser(context, email, password);
                        // Navigator.pop(context);
                      },
                      text: 'Re-Authentication',
                    ),
                  ],
                ),
              ),
            ));
      });
}
