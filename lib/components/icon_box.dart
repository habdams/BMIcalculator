import 'package:flutter/material.dart';
import '../constants.dart';


class IconBox extends StatelessWidget {
  IconBox({this.icon,this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 56.0,
        ),

        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
          ),
      ],
    );
  }
}