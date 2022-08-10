import 'package:flutter/material.dart';

//Colors
final colorBG = Color.fromRGBO(200, 200, 222, 1.0);
final colorTitle = Color.fromRGBO(0, 0, 0, 1.0);
final colorRecipeDescription = Color.fromRGBO(128, 128, 128, 0.8);
final colorIcons = Color.fromRGBO(255, 104, 0, 1.0);
final colorWhite = Color.fromRGBO(255, 255, 255, 1.0);

//Texts
final titlesStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: colorTitle,
  fontSize: 24.0
);

final titleMinimizedRecipeStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: colorTitle,
    fontSize: 18.0
);

final descriptonRecipeStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: colorRecipeDescription,
    fontSize: 14.0
);

final iconTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: colorTitle,
    fontSize: 14.0
);

final titlesDrawerHeader = TextStyle(
  fontWeight: FontWeight.bold,
  color: colorWhite,
  fontSize: 16.0
);
