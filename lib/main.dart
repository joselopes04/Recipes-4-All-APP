import 'package:Recipes_app/src/pages/favoritesPage.dart';
import 'package:Recipes_app/src/pages/shoppingListPage.dart';
import 'package:Recipes_app/src/pages/userPage.dart';
import 'package:flutter/material.dart';

//Pages
import 'package:Recipes_app/src/pages/categoryPage.dart';
import 'package:Recipes_app/src/pages/homePage.dart';
import 'package:Recipes_app/src/pages/recipePage.dart';
import 'package:Recipes_app/src/pages/welcomePage.dart';
import 'package:Recipes_app/src/pages/loginPage.dart';
import 'package:Recipes_app/src/pages/forgotPasswordPage.dart';
import 'package:Recipes_app/src/pages/registrationPage.dart';

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

        //Account
        'login': (BuildContext context) => LoginPage(),
        'registration': (BuildContext context) => RegistrationPage(),
        'forgotPassword': (BuildContext context) => ForgotPasswordPage(),

        //Bottom Navigation
        'home': (BuildContext context) => HomePage(),
        'favorites': (BuildContext context) => FavoritesPage(),
        'shoppingList': (BuildContext context) => ShoppingListPage(),
        'user': (BuildContext context) => UserPage(),

        //Recipes
        'category': (BuildContext context) => CategoryPage(),
        'recipe': (BuildContext context) => RecipePage(),
      },
    );
  }
}
