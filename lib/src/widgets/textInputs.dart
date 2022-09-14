import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

Widget emailInput() {
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.only(left: 20.0),
     height: 55.0,
    decoration: BoxDecoration(
      color: colorContainerInput,
      borderRadius: BorderRadius.circular(30.0)
    ),
    child: TextField(
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

Widget passwordInput() {
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.only(left: 20.0),
     height: 55.0,
    decoration: BoxDecoration(
        color: colorContainerInput,
        borderRadius: BorderRadius.circular(30.0)
    ),
    child: TextField(
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
