import 'package:flutter/material.dart';

//External libraries
import 'package:flutter_swiper/flutter_swiper.dart';

//View Models
import '../viewModels/ingredients.dart';

final controller = PageController(
    initialPage:1,
    viewportFraction: 0.3
);

Widget swiperIngredients(List<dynamic> ingredients){
  return Container(
    margin: const EdgeInsets.only(top: 10.0, left: 5.0),
    height: 110.0,
    child: Swiper(
      itemCount: 5,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index){
        return PageView(
          controller: controller,
          children: ingredientsList(ingredients),
        );
      },
    ),
  );
}
