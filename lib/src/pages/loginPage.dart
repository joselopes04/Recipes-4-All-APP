import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

//Widgets
import 'package:Recipes_app/src/widgets/buttons.dart';
import 'package:Recipes_app/src/widgets/textInputs.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Image(
                width: double.infinity,
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19744.jpg?w=996&t=st=1661963154~exp=1661963754~hmac=c0fe8579415171d3cdb8d2348af00edbf688b8530da29d374cecb0303073765c')),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: backButton(context, Colors.white),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Text('Welcome back', style: bigTitleStyle),
                SizedBox(height: 10.0),
                Text('Login to your account', style: titleMinimizedRecipeStyle),
                emailInput(),
                passwordInput(),
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                        child: Text('Forgot your password ?',
                            style: linksTextStyle),
                        onTap: () {
                          Navigator.pushNamed(context, 'forgotPassword');
                        })),
                SizedBox(height: 20.0),
                signInButton(context),
                Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: GestureDetector(
                        child: Text("Don't have an account ? Sign up",
                            style: linksTextStyle),
                        onTap: () {
                          Navigator.pushNamed(context, 'registration');
                        })),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
