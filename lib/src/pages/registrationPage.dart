import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_auth/firebase_auth.dart';

//Styles
import '../styles/styles.dart';

//Classes
import 'package:Recipes_app/src/userManagement/auth.dart';

//Widgets
import '../widgets/alerts.dart';
import '../widgets/buttons.dart';
import '../widgets/textInputs.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  String? errorMessage = 'Error:';

  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: controllerEmail.text.trim(),
        username: controllerUsername.text.trim(),
        password: controllerPassword.text.trim(),
      );
      Navigator.pushNamed(context, 'login');
       SnackBar snackBar = SnackBar(
        content: Text('Account created successfully'),
        backgroundColor: colorValidGreen,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        SnackBar snackBar = SnackBar(
          content: Text('The account already exists for that email.'),
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
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Text('Create an account', style: bigTitleStyle),
                    SizedBox(height: 30.0),
                    usernameInput(controllerUsername, colorInputBG, true),
                    SizedBox(height: 25.0),
                    emailInput(controllerEmail, colorInputBG, true),
                    SizedBox(height: 25.0),
                    passwordInput(controllerPassword, colorInputBG, true),
                    SizedBox(height: 10.0),
                    Text("By clicking Sign Up you agree with our "),
                    GestureDetector(
                      onTap: () {
                        showTerms(context);
                      },
                      child:
                          Text("Terms and conditions.", style: linksTextStyle),
                    ),
                    SizedBox(height: 20.0),
                    BasicButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          createUserWithEmailAndPassword();
                        } else {
                        }
                      },
                      text: 'Sign Up',
                      isActive: true,
                    ),
                  ]),
                ),
              ),
            )
          ],
        ));
  }
}
