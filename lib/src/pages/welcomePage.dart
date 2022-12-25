import 'package:flutter/material.dart';
import 'dart:ui';

//UserManagement
import 'package:Recipes_app/src/userManagement/auth.dart';

//Styles
import '../styles/styles.dart';

//Widgets
import 'package:Recipes_app/src/widgets/buttons.dart';

class WelcomePage extends StatelessWidget {
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1515669097368-22e68427d265?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('WELCOME TO RECIPES 4 ALL', style: giantTitlesStyle),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Text(
                  'Here you can find and learn new recipes step by step.',
                  style: descriptionTextStyle),
            ),
            BasicButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              text: 'Log In with email',
              isActive: true,
            ),
            SizedBox(height: 15.0),
            Container(
              width: 300.0,
              height: 45.0,
              child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    primary: colorWhite,
                    onPrimary: colorBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/images/googleLogo.png')),
                      Text('Sign in with Google'),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () async {
                dynamic result = await _auth.signInGuest();
                Navigator.pushNamed(context, 'home');
                print(result.uid + " " + result.isAnonymous);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Text('Navigate as guest', style: descriptionTextStyle),
              ),
            )
          ],
        )
      ],
    ));
  }
}
