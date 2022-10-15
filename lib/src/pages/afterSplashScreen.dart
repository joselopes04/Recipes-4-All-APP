import 'package:flutter/material.dart';

//UserManagement
import 'package:Recipes_app/src/userManagement/auth.dart';

class SplashScreen extends StatelessWidget {
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    _auth.isLoggedIn(context);
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      ),
    ));
  }
}
