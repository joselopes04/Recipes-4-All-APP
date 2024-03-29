import 'package:Recipes_app/src/styles/styles.dart';
import 'package:flutter/material.dart';

List<Widget> minimizedRecipes(BuildContext context, List<dynamic>? recipes) {
  final List<Widget> recipesList = [];

  recipes?.forEach((recipe) {
    final recipesListWidgetProvider =
        _minimizedRecipe(context, titlesStyle, recipe);
    recipesList.add(recipesListWidgetProvider);
  });
  return recipesList;
}

Widget _minimizedRecipe(
    BuildContext context, TextStyle style, Map<String, dynamic> recipe) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 15.0,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'recipe', arguments: recipe);
        },
        child: Image(
          image: NetworkImage(recipe['Image']),
          fit: BoxFit.fill,
          width: 300.0,
          height: 140.0,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Container(
        alignment: AlignmentDirectional.topStart,
        margin: EdgeInsets.only(left: 30.0, right: 15.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              recipe['Title'],
              style: style,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(children: <Widget>[
                      Icon(Icons.access_time_filled, color: colorIcons),
                      Container(
                        child: Text(
                          recipe['Time'],
                          style: iconTextStyle,
                        ),
                      )
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(children: <Widget>[
                      Icon(Icons.food_bank, color: colorIcons),
                      Container(
                        child: Text(
                          recipe['Difficulty'],
                          style: iconTextStyle,
                        ),
                      )
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(children: <Widget>[
                      Icon(Icons.person_sharp, color: colorIcons),
                      Container(
                        child: Text(
                          recipe['Servings'],
                          style: iconTextStyle,
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Text(
              recipe['Description'],
              textAlign: TextAlign.left,
              style: descriptonRecipeStyle,
            ),
          ],
        ),
      )
    ],
  );
}
