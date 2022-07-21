import 'package:Recipes_app/src/widgets/appBar.dart';
import 'package:Recipes_app/src/widgets/minimizedRecipe.dart';
import 'package:flutter/material.dart';
import '../styles/styles.dart';
import '../widgets/drawerMenu.dart';

class CategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      backgroundColor: colorBG,
     body: CustomScrollView(
        slivers: <Widget>[
          appBar(context, 'Breakfast'),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  minimizedRecipe(context),
                  minimizedRecipe(context),
                  minimizedRecipe(context),
                  minimizedRecipe(context),
                  minimizedRecipe(context),
                  minimizedRecipe(context)
                ]
              )
          )
        ],
     ),
    );
  }
}