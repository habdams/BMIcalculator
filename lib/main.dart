import 'package:flutter/material.dart';
import 'screens/inputPage.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff1D1E22),
        scaffoldBackgroundColor: Color(0xff1D1E22),
      ),
    );
  }
}


