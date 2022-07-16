import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class swiperCategory extends StatelessWidget {
  final controller = PageController(
      initialPage: 1,
      viewportFraction: 0.3
  );

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: 110.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return PageView(
            controller: controller,
            children: <Widget> [
              _cardCategory(),
              _cardCategory(),
              _cardCategory(),
              _cardCategory(),
              _cardCategory(),
            ],
          );
        },
        itemCount: 5,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
  Widget _cardCategory(){
    return GestureDetector(
      onTap: (){
        print('object');
      },
      child: Container(
        child: Image(
          image: AssetImage('assets/images/carouselFood1.jpg'),
        ),
      ),
    );
  }
}
