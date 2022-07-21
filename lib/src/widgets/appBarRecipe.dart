import 'package:flutter/material.dart';
import '../styles/styles.dart';

Widget appBarRecipe(){
  return SliverAppBar(
    backgroundColor: colorBG,
    floating: false,
    pinned: true,
    expandedHeight: 200.0,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: colorIconsAppBar
    ),
    flexibleSpace: FlexibleSpaceBar(
      background: FadeInImage(
        placeholder: AssetImage('assets/images/food2.jpg'),
        image: AssetImage('assets/images/food2.jpg'),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}