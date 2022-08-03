import 'package:Recipes_app/src/widgets/appBar.dart';
import 'package:flutter/material.dart';
import '../provider/recipesProvider.dart';
import '../styles/styles.dart';
import '../viewModels/minimizedRecipes.dart';
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
                  FutureBuilder(
                    future: recipesProvider.recivePopularRecipes(),
                    initialData: [],
                    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                      return Column(
                        children: minimizedRecipes(context, snapshot.data ),
                      );
                    },
                  ),
                ]
              )
          )
        ],
     ),
    );
  }
}