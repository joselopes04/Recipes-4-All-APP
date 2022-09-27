import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

Widget emailInput(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.only(left: 20.0),
     height: 55.0,
    decoration: BoxDecoration(
      color: colorContainerInput,
      borderRadius: BorderRadius.circular(30.0)
    ),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget usernameInput() {
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.only(left: 20.0),
    height: 55.0,
    decoration: BoxDecoration(
        color: colorContainerInput,
        borderRadius: BorderRadius.circular(30.0)
    ),
    child: TextField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          hintText: 'Username',
          border: OutlineInputBorder(
              borderSide: BorderSide.none
          )
      ),
    ),
  );
}

Widget passwordInput(TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.only(left: 20.0),
     height: 55.0,
    decoration: BoxDecoration(
        color: colorContainerInput,
        borderRadius: BorderRadius.circular(30.0)
    ),
    child: TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(
              borderSide: BorderSide.none
          )
      ),
    ),
  );
}
