import 'package:flutter/material.dart';

//Pages
import 'package:Recipes_app/src/pages/categoryPage.dart';
import 'package:Recipes_app/src/pages/homePage.dart';
import 'package:Recipes_app/src/pages/recipePage.dart';
import 'package:Recipes_app/src/pages/welcomePage.dart';
import 'package:Recipes_app/src/pages/loginPage.dart';
import 'package:Recipes_app/src/pages/forgotPasswordPage.dart';
import 'package:Recipes_app/src/pages/registrationPage.dart';
import 'package:Recipes_app/src/pages/favoritesPage.dart';
import 'package:Recipes_app/src/pages/shoppingListPage.dart';
import 'package:Recipes_app/src/pages/userPage.dart';
import 'package:Recipes_app/src/pages/afterSplashScreen.dart';
import 'package:Recipes_app/src/pages/addRecipe.dart';

//Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SplashScreen(),
        'welcome': (BuildContext context) => WelcomePage(),

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
        'createRecipe': (BuildContext context) => AddRecipe(),
      },
    );
  }
}


// class YourApp extends StatelessWidget{
//
//   @override
//   Widget build(BuildContext context){
//     return FutureBuilder<User>(
//         future: FirebaseAuth.instance.currentUser(),
//         builder: (BuildContext context, AsyncSnapshot<User> snapshot){
//           if (snapshot.hasData){
//             User? user = snapshot.data; // this is your user instance
//             /// is because there is user already logged
//             return MainScreen();
//           }
//           /// other way there is no user logged.
//           return LoginScreen();
//         }
//     );
//   }
// }
