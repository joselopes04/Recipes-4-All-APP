import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

Widget titles(String title) {
  return Container(
      alignment: AlignmentDirectional.topStart,
      margin: EdgeInsets.only(left: 30.0),
      child: Text(title, style: titlesStyle, )
  );
}