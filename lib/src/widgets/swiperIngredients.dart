import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class swiperIngredients extends StatelessWidget {
  final controller = PageController(
      initialPage: 1,
      viewportFraction: 0.3
  );

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 5.0),
      height: 110.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return PageView(
            controller: controller,
            children: [
              _image(),
              _image(),
              _image(),
              _image()
            ],
          );
        },
        itemCount: 5,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
}

Widget _image() {
  return Center(
    child: Image(
      alignment: Alignment.topLeft,
      image: AssetImage('assets/images/eggs.jpg'),
    ),
  );
}