import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

//Widgets
import 'package:Recipes_app/src/widgets/buttons.dart';
import 'package:Recipes_app/src/widgets/textInputs.dart';

class ForgotPasswordPage extends StatelessWidget {
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
                emailInput(),
                SizedBox(height: 35.0),
                forgotPasswordButton(context)
              ],
            ),
          )),
    );
  }
}

void showAlert(BuildContext context){
  showDialog(context: context, barrierDismissible: false, builder: (BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
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
              margin: EdgeInsets.only(bottom: 30.0, left: 15.0, right: 15.0),
              child: Text("We've sent an email with a link to reset your password.", style: blackDescriptionTextStyle),
            ),
            doneButton(context)
          ],
        ),
      ),

    );
  });
}
