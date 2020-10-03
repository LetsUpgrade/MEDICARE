import 'package:medicare/components/bottom_button.dart';
import 'package:medicare/components/icon_content.dart';
import 'package:medicare/components/reusable_card.dart';
import 'package:medicare/components/rounded_button.dart';
import 'package:medicare/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculator_brain.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    const defaultPadding = EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: kAppBarTextStyle,
        ),
      ),
      body: new SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                        labelColor: selectedGender == Gender.male
                            ? kActiveLabelTextColor
                            : kInactiveLabelTextColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,

                        label: 'FEMALE',
                        labelColor: selectedGender == Gender.female
                            ? kActiveLabelTextColor
                            : kInactiveLabelTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: defaultPadding,
              child: ReusableCard(
                color: kInactiveCardColor,
                cardChild: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
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
                            inactiveTrackColor: kInactiveTrackColor,
                            activeTrackColor: kActiveTrackColor,
                            thumbColor: kThumbColor,
                            overlayColor: kOverlayColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
                              });
                            },
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: defaultPadding,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,

                                onPressed: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age -= 1;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        buttonTitle: 'CALCULATE YOUR BMI',
        onTap: () {
          CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),
            ),
          );
        },
      ),
    );
  }
}
