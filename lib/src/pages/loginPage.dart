import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_auth/firebase_auth.dart';

//Styles
import '../styles/styles.dart';

//Classes
import 'package:Recipes_app/src/userManagement/auth.dart';

//Widgets
import 'package:Recipes_app/src/widgets/buttons.dart';
import 'package:Recipes_app/src/widgets/textInputs.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? errorMessage = 'Error:';
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
      );
      Navigator.pushNamed(context, 'home');
      SnackBar snackBar = SnackBar(
        content: Text('Log In was successfully'),
        backgroundColor: colorValidGreen,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBar snackBar = SnackBar(
          content: Text('User not found'),
          backgroundColor: colorErrorRed,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        SnackBar snackBar = SnackBar(
          content: Text('Email or Password are incorrect.'),
          backgroundColor: colorErrorRed,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: ListView(
            children: [
              Stack(
                children: [
                  Image(
                      width: double.infinity,
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19744.jpg?w=996&t=st=1661963154~exp=1661963754~hmac=c0fe8579415171d3cdb8d2348af00edbf688b8530da29d374cecb0303073765c')),
                  Container(
                    margin: EdgeInsets.only(top: 40.0),
                    child: backButton(context, Colors.white),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.all(20.0),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text('Welcome back', style: bigTitleStyle),
                          SizedBox(height: 10.0),
                          Text('Login to your account',
                              style: titleMinimizedRecipeStyle),
                          SizedBox(height: 20.0),
                          emailInput(controllerEmail),
                          SizedBox(height: 25.0),
                          passwordInput(controllerPassword),
                          Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: GestureDetector(
                                  child: Text('Forgot your password ?',
                                      style: linksTextStyle),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, 'forgotPassword');
                                  })),
                          SizedBox(height: 20.0),
                          BasicButton(
                            onPressed: () {
                              signInWithEmailAndPassword();
                            },
                            text: 'Sign Up',
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15.0),
                              child: GestureDetector(
                                  child: Text("Don't have an account ? Sign up",
                                      style: linksTextStyle),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, 'registration');
                                  })),
                        ],
                      ),
                    ),
                  ))
            ],
          ));
  }
}
