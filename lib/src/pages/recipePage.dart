import 'package:flutter/material.dart';

//External libraries
import 'package:url_launcher/url_launcher_string.dart';

//Styles
import '../styles/styles.dart';

//Widgets
import 'package:Recipes_app/src/widgets/swiperIngredients.dart';
import 'package:Recipes_app/src/widgets/titles.dart';
import '../widgets/appBarRecipe.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> recipe = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        backgroundColor: colorBG,
        body:CustomScrollView(
          slivers: <Widget>[
            appBarRecipe(recipe['Image']),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 15.0),
                      _recipeDescription(recipe, titlesStyle),
                      SizedBox(height: 15.0),
                      titles('Ingredients'),
                      swiperIngredients(recipe['Ingredients']),
                      SizedBox(height: 15.0),
                      titles('Preparation'),
                      _recipeBody(recipe['Preparation'], recipe['Source']),
                    ],
                )
            )
          ],
        )
    );
  }
}
Widget _recipeDescription(Map<String,dynamic> recipe, style ){
  return Container(
    alignment: AlignmentDirectional.topStart,
    margin: EdgeInsets.only(left: 30.0, right: 15.0, bottom: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          recipe['Title'], style: style,
        ),
        Text( recipe['Description'],
          textAlign: TextAlign.left,
          style: descriptonRecipeStyle,
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0),
          child: Row(
            children: <Widget> [
              Expanded(
                flex: 1,
                child: Row(
                    children: <Widget> [
                      Icon(Icons.access_time, color: colorIcons),
                      Container(
                        child: Text( recipe['Time'],
                          style: iconTextStyle ,
                        ),
                      )
                    ]
                ),
              ),

              Expanded(
                flex: 1,
                child: Row(
                    children: <Widget> [
                      Icon(Icons.food_bank_outlined, color: colorIcons),
                      Container(
                        child: Text(recipe['Difficulty'],
                          style: iconTextStyle ,
                        ),
                      )
                    ]
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                    children: <Widget> [
                      Icon(Icons.person_sharp, color: colorIcons),
                      Container(
                        child: Text(recipe['Servings'],
                          style: iconTextStyle ,
                        ),
                      )
                    ]
                ),
              ),

            ],
          ),
        )

      ],
    ),
  );
}
Widget _recipeBody(String description, url){

  return Container(
    margin: EdgeInsets.only(top: 5.0, left: 30.0, right: 20.0, bottom: 50.0),
    child: Column(
      children: [
        Text(description, style: descriptonRecipeStyle),
        ElevatedButton(
            onPressed: () async {
              if (await launchUrlString(url)) {
                await canLaunchUrlString(url);
              } else {
                throw 'Could not launch $url';
              }
              }
              ,child: Text('See original recipe')
        )
      ],
    )
  );
}