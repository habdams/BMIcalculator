import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_box.dart';
import '../components/reuseable_card.dart';
import '../constants.dart';
import '../components/round_button.dart';
import '../components/navigation_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'result_page.dart';

enum Gender{
  male,
  female,
}

int height = 180;
int weight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
    Color femaleCardColour = kInactiveCardColour;
    Color maleCardColour = kInactiveCardColour;

    Gender selectedGender ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male? kActiveCardColour:kInactiveCardColour,
                  cardChild: IconBox(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE'
                  ),

                  ),
              ),
              Expanded(
                child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female? kActiveCardColour:kInactiveCardColour,
                    cardChild: IconBox(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    )
                ),
              )],
          ),
          ),

          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Text('HEIGHT',
                  style:kLabelTextStyle ),

              //    SizedBox(height: 5.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                          height.toString(),
                          style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8398),
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,

                      onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });

                         },

                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(

                  colour: kActiveCardColour,

                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',
                      style: kLabelTextStyle,
                      ),
                      Text(weight.toString(),
                        style: kNumberTextStyle,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed:(){
                              setState(() {
                                weight--;
                            });
                            },

                          ),

                          SizedBox(width: 10.0),

                          RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });

                            },

                          ),

                        ],
                      ),
                    ],
                  ),
                 ),
              ),

              Expanded(

                child: ReusableCard(
                   colour: kActiveCardColour,

                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text('AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(age.toString(),
                        style: kNumberTextStyle,
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed:(){
                              setState(() {
                                age--;
                              });
                            },

                          ),

                          SizedBox(width: 10.0),

                          RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });

                            },

                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),

          NavigationButton(text: "CALCULATE",
              onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context,
                MaterialPageRoute
                  (builder:(context) => ResultPage(
                  bmi: calc.calculateBMI(),
                  result: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                )
                ),
              );
              },
          ),
        ],
      ) ,






    );
  }
}






