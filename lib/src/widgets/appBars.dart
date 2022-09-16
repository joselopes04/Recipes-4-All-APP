import 'package:flutter/material.dart';

//Delegates
import 'package:Recipes_app/src/delegates/searchRecipes.dart';

//Styles
import '../styles/styles.dart';

Widget appBar(BuildContext context, String title){
  return SliverAppBar(
    backgroundColor: colorBG,
    floating: false,
    pinned: true,
    elevation: 0.0,
    title: Text(title, style: titlesStyle),
    actions: <Widget>[
      Container(
        padding:const EdgeInsets.all(15.0),
        child: IconButton(
            onPressed: (){
              showSearch(
                  context: context,
                  delegate: searchRecipesDelegate()
              );
            },
            icon: const Icon(
              Icons.search,
              color:  Color.fromRGBO(255, 255, 255, 1.0),
              size: 25.0,
            ),
        )
      )
    ],
  );
}

Widget appBarRecipe(String image){
  return SliverAppBar(
    backgroundColor: colorBG,
    floating: false,
    pinned: true,
    expandedHeight: 200.0,
    elevation: 0.0,
    iconTheme: IconThemeData(
        color: colorWhite
    ),
    flexibleSpace: FlexibleSpaceBar(
      background: FadeInImage(
        placeholder: NetworkImage(image),
        image: NetworkImage(image),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}
