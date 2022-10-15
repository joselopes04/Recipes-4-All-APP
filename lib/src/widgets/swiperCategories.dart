import 'package:flutter/material.dart';

//External libraries
import 'package:flutter_swiper/flutter_swiper.dart';

//View Model
import 'package:Recipes_app/src/viewModels/categories.dart';

//Provider
import '../provider/recipesProvider.dart';

class SwiperCategory extends StatefulWidget {
  @override
  State<SwiperCategory> createState() => _SwiperCategory();

}

class _SwiperCategory extends State<SwiperCategory> {
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
