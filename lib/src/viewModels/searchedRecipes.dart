import 'dart:ffi';

import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

List<Widget> searchedRecipes(
    BuildContext context, List<dynamic>? recipes, String searchInput) {
  final List<Widget> resultsList = [];

  int i = 0;
  recipes?.forEach((recipe) {
    var title = recipe['Title'].toString();
    if (title.contains(searchInput)) {
      i++;
      final recipesListWidgetProvider =
          _minimizedRecipe(context, titlesStyle, recipe);
      resultsList.add(recipesListWidgetProvider);
    }
  });
  print('$i resultados para a sua pesquisa'); //i = num of search results
  return resultsList;
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
            Text(
              recipe['Description'],
              textAlign: TextAlign.left,
              style: descriptonRecipeStyle,
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(children: <Widget>[
                      Icon(Icons.access_time, color: colorIcons),
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
                      Icon(Icons.food_bank_outlined, color: colorIcons),
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
            )
          ],
        ),
      )
    ],
  );
}
