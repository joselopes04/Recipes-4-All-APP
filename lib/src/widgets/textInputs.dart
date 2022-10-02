import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

Widget emailInput(TextEditingController controller) {
  final emailValidator = RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
  return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: colorContainerInput,
        hintText: 'Email',
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) {
        if (email!.isEmpty) {
          return "Please enter an email";
        }else if(emailValidator.hasMatch(email) == false) {
          return "Please enter a valid email";
        };
      });
}

Widget usernameInput(TextEditingController controller) {
  final usernameValidator = RegExp(r'^(?=[a-zA-Z0-9._]{3,20}$)(?!.*[_.]{2})[^_.].*[^_.]$');
  return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          filled: true,
          fillColor: colorContainerInput,
          hintText: 'Username',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (username) {
        if (username!.isEmpty) {
          return "Please enter an username";
        }else if(usernameValidator.hasMatch(username) == false){
          return "Must have 3-20 characters and no special characters only this( -._ ) ";
        };
      });
}

Widget passwordInput(TextEditingController controller) {
  final passwordValidator = RegExp(r'^(?=.*[a-z])(?=.*\d)[a-zA-Z\d\w\W]{8,20}$');
  return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          filled: true,
          fillColor: colorContainerInput,
          hintText: 'Password',
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (password) {
        if (password!.isEmpty) {
          return "Please enter a strong password";
        }else if(passwordValidator.hasMatch(password) == false){
          return "Must have 8-20 characters and at least 1 number";
        };
      });
}
