import 'package:Recipes_app/src/provider/recipesProvider.dart';
import 'package:flutter/material.dart';

List<Widget> categories(BuildContext context){
  final List<Widget> categoriesList= [];
  final List<dynamic> categories = recipesProvider.categories;

  categories.forEach((category) {
    final Widget widgetProvider = _cardCategory(context, category);
     categoriesList.add(widgetProvider);
  });

  return categoriesList;
}

Widget _cardCategory(BuildContext context, Map<String,dynamic> category){
  return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, 'category', arguments: category);
    },
    child: Stack(
      children: [
        Container(
          width: 130.0,
          height: 100.0,
          margin: EdgeInsets.only(right: 15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              image: NetworkImage(category['Image']),
              fit: BoxFit.cover,
            )
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20.0),
          child: Text(category['name'],
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
