import 'package:flutter/material.dart';

//Styles
import 'package:Recipes_app/src/styles/styles.dart';

//Widgets
import 'package:Recipes_app/src/widgets/appBars.dart';
import 'package:Recipes_app/src/widgets/bottomNavigation.dart';
import '../widgets/drawerMenu.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: colorBG,
        body: CustomScrollView(
          slivers: <Widget>[
            appBar(context, 'My profile'),
            SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: <Widget>[
                      Text("User")
                    ],
                  )
                ]))
          ],
        ),
        bottomNavigationBar: bottomNavigation(context)
    );
  }
}
