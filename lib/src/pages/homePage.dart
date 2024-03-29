import 'package:flutter/material.dart';

//Provider
import 'package:Recipes_app/src/provider/recipesProvider.dart';

//View Model
import 'package:Recipes_app/src/viewModels/minimizedRecipes.dart';

//Styles
import 'package:Recipes_app/src/styles/styles.dart';

//Widgets
import 'package:Recipes_app/src/widgets/titles.dart';
import 'package:Recipes_app/src/widgets/bottomNavigation.dart';
import 'package:Recipes_app/src/widgets/appBars.dart';
import 'package:Recipes_app/src/widgets/swiperRecents.dart';
import 'package:Recipes_app/src/widgets/drawerMenu.dart';
import '../widgets/swiperCategories.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        backgroundColor: colorBG,
        floatingActionButton: FloatingActionButton(
          tooltip: "Add recipe",
          backgroundColor: colorIcons,
          onPressed: () {
            Navigator.pushNamed(context, "createRecipe");
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: CustomScrollView(
          slivers: <Widget>[
            appBar(context, 'Home'),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: <Widget>[
                  SwiperRecents(),
                  titles('Categories'),
                  SwiperCategory(),
                  titles('Popular Recipes'),
                  FutureBuilder(
                    future: recipesProvider.reciveAllRecipes(),
                    initialData: [],
                    builder: (BuildContext context,
                        AsyncSnapshot<List<dynamic>> snapshot) {
                      return Column(
                        children: minimizedRecipes(context, snapshot.data),
                      );
                    },
                  ),
                ],
              )
            ]))
          ],
        ),
        bottomNavigationBar: bottomNavigation(context));
  }
}
