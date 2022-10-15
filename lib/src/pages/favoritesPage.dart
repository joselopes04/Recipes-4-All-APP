import 'package:flutter/material.dart';

//Styles
import 'package:Recipes_app/src/styles/styles.dart';

//Widgets
import 'package:Recipes_app/src/widgets/appBars.dart';
import 'package:Recipes_app/src/widgets/bottomNavigation.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBG,
        body: CustomScrollView(
          slivers: <Widget>[
            appBarOnlyTitle('Favorites'),
            SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: <Widget>[
                      Text("Favorites")
                    ],
                  )
                ]))
          ],
        ),
        bottomNavigationBar: bottomNavigation(context)
    );
  }
}
