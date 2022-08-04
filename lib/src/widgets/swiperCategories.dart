import 'package:flutter/material.dart';

//View Model
import 'package:Recipes_app/src/viewModels/categories.dart';

//Provider
import '../provider/recipesProvider.dart';

//Widgets
import 'package:flutter_swiper/flutter_swiper.dart';


class
SwiperCategory extends StatelessWidget {
  final controller = PageController(
      initialPage: 1,
      viewportFraction: 0.3
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: 110.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return FutureBuilder(
            future: recipesProvider.reciveCategories(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              return PageView(
                  controller: controller,
                  children: categories(context)
              );
            },
          );
        },
        itemCount: 5,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
}
