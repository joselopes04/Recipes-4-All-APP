import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

Widget backButton(BuildContext context, Color color) {
  return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: color,
      ));
}

Widget loginButton(BuildContext context) {
  return Container(
    width: 300.0,
    height: 45.0,
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'login');
      },
      style: ElevatedButton.styleFrom(
        primary: colorLoginBtn,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text('Log In with email'),
    ),
  );
}

Widget signInButton(BuildContext context) {
  return Container(
    width: 300.0,
    height: 45.0,
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'SignIn');
      },
      style: ElevatedButton.styleFrom(
        primary: colorLoginBtn,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text('Log In with email'),
    ),
  );
}


