import 'package:Recipes_app/src/widgets/minimizedRecipe.dart';
import 'package:Recipes_app/src/widgets/swiperIngredients.dart';
import 'package:Recipes_app/src/widgets/titles.dart';
import 'package:flutter/material.dart';
import '../styles/styles.dart';
import '../widgets/appBarRecipe.dart';

class RecipePage extends StatelessWidget {

  final String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu malesuada elit, eget ullamcorper massa. Nulla elementum eros neque, a sollicitudin urna rhoncus a. Suspendisse ut enim at urna dictum tristique vitae in elit. Maecenas venenatis placerat volutpat. Ut in lacus sodales, consequat tortor sed, posuere arcu. In vitae ante vitae lectus pulvinar rhoncus. Aenean convallis fringilla pretium. Donec sed eros arcu. Donec eget nisl orci. Maecenas a maximus tellus, a ullamcorper velit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu malesuada elit, eget ullamcorper massa. Nulla elementum eros neque, a sollicitudin urna rhoncus a. Suspendisse ut enim at urna dictum tristique vitae in elit. Maecenas venenatis placerat volutpat. Ut in lacus sodales, consequat tortor sed, posuere arcu. In vitae ante vitae lectus pulvinar rhoncus. Aenean convallis fringilla pretium. Donec sed eros arcu. Donec eget nisl orci. Maecenas a maximus tellus, a ullamcorper velit.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBG,
        body:CustomScrollView(
          slivers: <Widget>[
            appBarRecipe(),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      textMinimizedRecipe(titlesStyle),
                      titles('Ingredients'),
                      swiperIngredients(),
                      SizedBox(height: 15.0),
                      titles('Preparation'),
                      _recipeDescription(description)
                    ],
                )
            )
          ],
        )
    );
  }
}

Widget _recipeDescription(String description){
  return Container(
    margin: EdgeInsets.only(top: 5.0, left: 30.0, right: 20.0, bottom: 50.0),
    child: Text(description, style: descriptonRecipeStyle),
  );
}