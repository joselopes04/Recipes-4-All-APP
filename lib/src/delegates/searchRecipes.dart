import 'package:flutter/material.dart';

//Provider
import '../provider/recipesProvider.dart';

//ViewModel
import 'package:Recipes_app/src/viewModels/searchedRecipes.dart';

//Styles
import 'package:Recipes_app/src/styles/styles.dart';

class searchRecipesDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            this.query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          this.close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: recipesProvider.recivePopularRecipes(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        List<dynamic>? recipes = snapshot.data;
        var searchInput = this.query.toLowerCase();
        return CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: searchedRecipes(context, recipes, searchInput),
              )
            ]))
          ],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Search all your favorite recipes',
        style: descriptonRecipeStyle,
      ),
    );
  }
}
