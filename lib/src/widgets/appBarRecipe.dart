import 'package:flutter/material.dart';
import '../styles/styles.dart';

Widget appBarRecipe(String image){

  return SliverAppBar(
    backgroundColor: colorBG,
    floating: false,
    pinned: true,
    expandedHeight: 200.0,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: colorWhite
    ),
    flexibleSpace: FlexibleSpaceBar(
      background: FadeInImage(
        placeholder: NetworkImage(image),
        image: NetworkImage(image),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}