import 'package:Recipes_app/src/widgets/popularRecipes.dart';
import 'package:Recipes_app/src/widgets/titles.dart';
import 'package:Recipes_app/src/styles/styles.dart';
import 'package:Recipes_app/src/widgets/appBar.dart';
import 'package:Recipes_app/src/widgets/swiperRecents.dart';
import 'package:Recipes_app/src/widgets/drawerMenu.dart';
import 'package:flutter/material.dart';

import '../widgets/swiperCategories.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: colorBG,
        body:CustomScrollView(
          slivers: <Widget>[
            appBar(context),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Column(
                        children: <Widget>[
                          swiperRecents(),
                          titles('Categories'),
                          swiperCategory(),
                          titles('Popular Recipes'),
                          popularRecipes(),
                          popularRecipes(),
                          popularRecipes(),
                          popularRecipes(),
                          popularRecipes(),
                          popularRecipes()
                        ],
                      )
                    ]
                )
            )
          ],
        )
    );
  }
}




