import 'package:flutter/material.dart';
import 'dart:ui';

//Styles
import '../styles/styles.dart';

class WelcomePage extends StatelessWidget {
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
              child:
                  Text('WELCOME TO RECIPES 4 ALL', style: welcomeTitlesStyle),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Text(
                  'Here you can find and learn new recipes step by step.',
                  style: welcomeTextStyle),
            ),
            Container(
              width: 300.0,
              height: 45.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: colorLoginBtn,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text('Log In'),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              width: 300.0,
              height: 45.0,
              child: ElevatedButton(
                onPressed: () {},
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
                )
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  child: Text(
                      'Navigate as guest',
                      style: welcomeTextStyle
                  ),
              ),
            )

          ],
        )
      ],
    ));
  }
}