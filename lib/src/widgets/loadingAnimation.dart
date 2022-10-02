import 'package:flutter/material.dart';

//Styles
import 'package:Recipes_app/src/styles/styles.dart';

//External libraries
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorBG,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitPouringHourGlassRefined(
              color: colorIcons,
              size: 150.0,
            ),
            SizedBox(height: 15.0),
            Text(
              "Loading ...",
              style: bigTitleStyle,
            )
          ],
        )),
      ),
    );
  }
}
