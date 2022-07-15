import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class carrousel extends StatelessWidget {
  final controller = PageController(
    initialPage:1,
    viewportFraction: 1
  );

  @override
  Widget build(BuildContext context){
    return Container(
      height: 200.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return PageView(
            controller: controller,
            children: <Widget> [
              _card()
            ],
          );
        },
        itemCount: 2,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
  Widget _card(){
    return Container(
      alignment: AlignmentDirectional.center,
      child: Image(
        image: AssetImage('assets/images/carouselFood1.jpg'),
        fit: BoxFit.fill,
      ),
    );
  }

}
