import 'package:flutter/material.dart';


Widget emailInput(TextEditingController controller, Color fillColor, bool enabled) {
  final emailValidator = RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
  return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        enabled: enabled,
        prefixIcon: Icon(Icons.email),
        fillColor: fillColor,
        hintText: 'Email',
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) {
        if (email!.isEmpty) {
          return "Please enter an email";
        } else if (emailValidator.hasMatch(email) == false) {
          return "Please enter a valid email";
        }
        ;
        return null;
      });
}

Widget usernameInput(TextEditingController controller, Color fillColor, bool enabled) {
  final usernameValidator =
  RegExp(r'^(?=[a-zA-Z0-9._]{3,20}$)(?!.*[_.]{2})[^_.].*[^_.]$');
  return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          enabled:enabled,
          filled: true,
          prefixIcon: Icon(Icons.person),
          fillColor: fillColor,
          hintText: 'Username',
          border:
          UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (username) {
        if (username!.isEmpty) {
          return "Please enter an username";
        } else if (usernameValidator.hasMatch(username) == false) {
          return "Must have 3-20 characters and no special characters only this( -._ ) ";
        }
        ;
        return null;
      });
}

Widget passwordInput(TextEditingController controller, Color fillColor, bool enabled) {
  final passwordValidator =
  RegExp(r'^(?=.*[a-z])(?=.*\d)[a-zA-Z\d\w\W]{8,20}$');
  return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          filled: true,
          enabled: enabled,
          prefixIcon: Icon(Icons.lock),
          fillColor: fillColor,
          hintText: 'Password',
          border:
          UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (password) {
        if (password!.isEmpty) {
          return "Please enter a strong password";
        } else if (passwordValidator.hasMatch(password) == false) {
          return "Must have 8-20 characters and at least 1 number";
        }
        ;
        return null;
      });
}
