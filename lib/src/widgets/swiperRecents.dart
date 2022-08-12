import 'package:flutter/material.dart';

//External libraries
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperRecents extends StatelessWidget {
  final controller = PageController(
    initialPage:0,
    viewportFraction: 1
  );

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 180.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return PageView(
            controller: controller,
            children: <Widget> [
              _cardRecents(),
              _cardRecents(),
              _cardRecents(),
              _cardRecents()
            ],
          );
        },
        itemCount: 3,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
  Widget _cardRecents(){
    return Container(
      alignment: AlignmentDirectional.center,
      child: Image(
        image: AssetImage('assets/images/carouselFood1.jpg'),
        fit: BoxFit.fill,
      ),
    );
  }

}
