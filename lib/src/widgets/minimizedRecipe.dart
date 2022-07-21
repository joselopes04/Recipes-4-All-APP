import 'package:flutter/material.dart';
import '../styles/styles.dart';

Widget minimizedRecipe(BuildContext context){
  return Column(
    children: <Widget> [
      SizedBox(
        height: 15.0,
      ),
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, 'recipe');
        },
        child: const Image(
          image: AssetImage('assets/images/food2.jpg'),
          fit: BoxFit.fill,
          width: 300.0,
          height: 140.0,
        ),
      ),
      textMinimizedRecipe(titleMinimizedRecipeStyle)
    ],
  );
}


Widget textMinimizedRecipe(TextStyle style){
  return Column(
    children: <Widget>[
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
              'Ovos Mexidos', style: style,
            ),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at ipsum nisl. Nulla facilisi. Cras fringilla mauris diam, id sollicitudin augue ultricies non. Nam lacinia.',
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
                          child: Text('5 min',
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
                              child: Text('Easy',
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
      )
    ],
  );
}