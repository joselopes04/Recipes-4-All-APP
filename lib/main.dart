import 'package:flutter/material.dart';
import 'package:Recipes_app/src/pages/categoryPage.dart';
import 'package:Recipes_app/src/pages/homePage.dart';
import 'package:Recipes_app/src/pages/recipePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      routes:<String,WidgetBuilder> {
        '/' : (BuildContext context) => HomePage(),
        '/category' : (BuildContext context) => CategoryPage(),
        '/recipe' : (BuildContext context) => RecipePage(),
      },
    );
  }
}




