import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;

  double _bmi;

  String calculateBMI(){

    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){

    if(_bmi >= 25) {
      return 'You are Overweight';
    }
    else if(_bmi > 18.5) {
      return 'normal';
    }
    else {
      return 'underweight';
    }

  }

  String getInterpretation(){

    if( _bmi >= 25) {
      return 'You need to excercise more';
    }
    else if( _bmi > 18.5) {
      return 'Good job!';
    }
    else {
      return 'Eat a bit more';
    }

  }


}