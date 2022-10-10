import 'package:flutter/material.dart';

//Styles
import '../styles/styles.dart';

Widget backButton(BuildContext context, Color color) {
  return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: color,
      ));
}

class BasicButton extends StatefulWidget {
  final GestureTapCallback onPressed;
  final String text;

  BasicButton({required this.onPressed, required this.text});

  @override
  _BasicButtonState createState() => _BasicButtonState();
}

class _BasicButtonState extends State<BasicButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.0,
        height: 45.0,
        child: ElevatedButton(
            onPressed: () {
              widget.onPressed();
            },
            style: ElevatedButton.styleFrom(
              primary: colorLogo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text(widget.text)));
  }
}
