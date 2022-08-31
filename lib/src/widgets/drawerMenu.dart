import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu ({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image:DecorationImage(
                  image: AssetImage('assets/images/food2.jpg'),
                  fit: BoxFit.cover,
                )
              ),
              child: Container(
                child: Text('RECIPES 4 ALL', style: titlesDrawerHeader),
              ),
            ),
            ListTile(
              leading: Icon(Icons.bookmark, color: colorIcons),
              title: Text('Favorites'),
              onTap: (){
                Navigator.pushNamed(context, 'welcome');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket, color: colorIcons),
              title: Text('Shoping list'),
              onTap: (){
                Navigator.pushNamed(context, 'category');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: colorIcons),
              title: Text('Settings'),
              onTap: (){
                Navigator.pushNamed(context, 'category');
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: colorIcons),
              title: Text('About the app'),
              onTap: (){
                Navigator.pushNamed(context, 'category');
              },
            )
          ],
        ),
      ),
    );
  }
}