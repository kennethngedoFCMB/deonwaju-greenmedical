import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = tiffanyBlue,
    this.textColor = Colors.white, onPressed, Text child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor,
              fontSize: 18
            ),
          ),
        ),
      ),
    );

  }

}