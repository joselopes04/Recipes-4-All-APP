import 'package:flutter/material.dart';

List<Widget> ingredientsList(List<dynamic> ingredients){
  final List<Widget> listIngredients = [];
  final List<dynamic> ingredientsList = ingredients;

  ingredientsList.forEach((ingredient) {
    final Widget widgetProvider = _cardIngredient(ingredient );
    listIngredients.add(widgetProvider);
  });

  return listIngredients;
}


Widget _cardIngredient(Map<String,dynamic> ingredient){
  return Center(
      child: Stack(
        children: [
          Container(
            width: 130.0,
            height: 100.0,
            margin: EdgeInsets.only(right: 15.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  image: NetworkImage(ingredient['Photo']),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(20.0),
            child: Text(ingredient['Name'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  decorationColor: Colors.black,
                  decorationStyle: TextDecorationStyle.wavy
              ),
            ),
          )
        ],
      )
  );

}