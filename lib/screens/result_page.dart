import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reuseable_card.dart';
import '../components/navigation_button.dart';

class ResultPage extends StatelessWidget {
  @override
  ResultPage({@required this.bmi, @required this.interpretation, @required this.result});

  final String bmi;
  final String result;
  final String interpretation;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                colour: kActiveCardColour,
                onPress: (){
                },
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment:  CrossAxisAlignment.center,

                  children: <Widget>[
                    Text(result,
                    style: kMainTopResultTextStyle,),
                    Text(bmi,
                    style: kMainResultTextStyle,
                    ),

                    Text(interpretation,
                    style: kLabelTextStyle,),
                  ],
                ),

              ),
          ),
          Expanded(
            child: NavigationButton(text:'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },),
          ),


        ],
      ),


    );
  }
}
