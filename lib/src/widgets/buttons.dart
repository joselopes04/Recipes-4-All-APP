import 'package:flutter/material.dart';

//Pages
import '../pages/forgotPasswordPage.dart';

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
        Navigator.pushNamed(context, 'home');
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

Widget signUpButton(BuildContext context) {
  return Container(
    width: 300.0,
    height: 45.0,
    child: ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
        primary: colorLoginBtn,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text('Sign Up'),
    ),
  );
}

Widget forgotPasswordButton(BuildContext context) {
  return Container(
    width: 300.0,
    height: 45.0,
    child: ElevatedButton(
      onPressed: () {
        showAlert(context);
      },
      style: ElevatedButton.styleFrom(
        primary: colorLoginBtn,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text('Reset password'),
    ),
  );
}

Widget doneButton(BuildContext context) {
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
      child: Text('Done'),
    ),
  );
}

Widget closePopUpButton(BuildContext context) {
  return Container(
    width: 300.0,
    height: 45.0,
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        primary: colorLoginBtn,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text('Close'),
    ),
  );
}

