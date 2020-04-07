import 'package:flutter/material.dart';
import '../constants.dart';


class NavigationButton extends StatelessWidget {

  NavigationButton({@required this.text, @required this.onTap});

  final String text;
  final Function onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(text,
            style: kButtonTextStyle,
          ),
        ) ,

        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomButtonHeight,
        color: KBottomContainerColour,

      ),
    );
  }
}