import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

Widget emailInput(TextEditingController controller) {
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
          return "Please enter a  email";
        };
      });
}

Widget usernameInput(TextEditingController controller) {
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
      validator: (email) {
        if (email!.isEmpty) {
          return "Please enter a username";
        };
      });
}

Widget passwordInput(TextEditingController controller) {
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
      validator: (email) {
        if (email!.isEmpty) {
          return "Please enter a strong password";
        };
      });
}
