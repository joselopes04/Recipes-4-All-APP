import 'package:flutter/material.dart';

//Provider
import '../provider/recipesProvider.dart';

//ViewModel
import '../viewModels/minimizedRecipes.dart';

//Styles
import '../styles/styles.dart';

//Widgets
import '../widgets/drawerMenu.dart';
import 'package:Recipes_app/src/widgets/appBar.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> category =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      drawer: const DrawerMenu(),
      backgroundColor: colorBG,
      body: CustomScrollView(
        slivers: <Widget>[
          appBar(context, category['name']),
          SliverList(
              delegate: SliverChildListDelegate([
            FutureBuilder(
              future: recipesProvider.reciveCategoryRecipes(category['name']),
              initialData: [],
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                return Column(
                  children: minimizedRecipes(context, snapshot.data),
                );
              },
            ),
          ]))
        ],
      ),
    );
  }
}
