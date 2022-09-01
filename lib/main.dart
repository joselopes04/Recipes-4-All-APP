import 'package:flutter/material.dart';

//Pages
import 'package:Recipes_app/src/pages/categoryPage.dart';
import 'package:Recipes_app/src/pages/homePage.dart';
import 'package:Recipes_app/src/pages/recipePage.dart';
import 'package:Recipes_app/src/pages/welcomePage.dart';
import 'package:Recipes_app/src/pages/loginPage.dart';

//Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WelcomePage(),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => WelcomePage(),
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'category': (BuildContext context) => CategoryPage(),
        'recipe': (BuildContext context) => RecipePage(),
      },
    );
  }
}
