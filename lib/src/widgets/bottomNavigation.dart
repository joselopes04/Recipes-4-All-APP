import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

Widget bottomNavigation(BuildContext context) {
  String? route = ModalRoute.of(context)?.settings.name;
  Color? colorHome, colorFav, colorShop, colorUser = colorIcons;

  //Change color of current route icon
  if (route == 'home') {
    colorHome = colorWhite;
  } else if (route == 'favorites') {
    colorFav = colorWhite;
  } else if (route == 'shoppingList') {
    colorShop = colorWhite;
  } else {
    colorUser = colorWhite;
  }

  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    color: colorBG,
    child: IconTheme(
      data: IconThemeData(color: colorIcons),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                color: colorHome,
                tooltip: "Home",
                onPressed: () {
                  if (route != 'home') {
                    Navigator.pushNamed(context, 'home');
                  }
                },
                icon: Icon(Icons.explore)),
            IconButton(
                color: colorFav,
                tooltip: "Saved",
                onPressed: () {
                  if (route != 'favorites') {
                    Navigator.pushNamed(context, 'favorites');
                  }
                },
                icon: Icon(Icons.bookmark)),
            SizedBox(width: 10.0),
            IconButton(
                color: colorShop,
                tooltip: "Shopping List",
                onPressed: () {
                  if (route != 'shoppingList') {
                    Navigator.pushNamed(context, 'shoppingList');
                  }
                },
                icon: Icon(Icons.shopping_basket)),
            IconButton(
                color: colorUser,
                tooltip: "My profile",
                onPressed: () {
                  if (route != 'user') {
                    Navigator.pushNamed(context, 'user');
                  }
                },
                icon: Icon(Icons.person))
          ],
        ),
      ),
    ),
  );
}
