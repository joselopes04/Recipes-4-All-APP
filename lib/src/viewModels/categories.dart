import 'package:flutter/material.dart';

//Provider
import 'package:Recipes_app/src/provider/recipesProvider.dart';

List<Widget> categories(BuildContext context) {
  final List<Widget> categoriesList = [];
  final List<dynamic> categories = recipesProvider.categories;

  categories.forEach((category) {
    final Widget widgetProvider = _cardCategory(context, category);
    categoriesList.add(widgetProvider);
  });

  return categoriesList;
}

Widget _cardCategory(BuildContext context, Map<String, dynamic> category) {
  return GestureDetector(
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
          child: Text(
            category['name'],
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                decorationColor: Colors.black,
                decorationStyle: TextDecorationStyle.wavy),
          ),
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context, 'category', arguments: category);
    },
  );
}

Widget carrdCategory() {
  return GestureDetector(
    child: Stack(
      children: [
        Container(
          width: 230.0,
          height: 200.0,
          margin: EdgeInsets.only(right: 15.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: NetworkImage('https://st2.depositphotos.com/1005147/5192/i/450/depositphotos_51926417-stock-photo-hands-holding-the-sun-at.jpg'),
                fit: BoxFit.cover,
              )),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20.0),
          child: Text(
            'olá',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                decorationColor: Colors.white,
                decorationStyle: TextDecorationStyle.wavy),
          ),
        )
      ],
    ),
  );
}
