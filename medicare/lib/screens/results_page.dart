import 'package:medicare/components/bottom_button.dart';
import 'package:medicare/components/reusable_card.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: kAppBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,

                      ),
                      Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        'Normal BMI range:',
                        style: kLabelTextStyle.copyWith(
                          fontSize: 20.0,
                          fontFamily: 'NunitoSemiBold',
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text('18,5 - 25 kg/m2',
                          style: kNumberTextStyle.copyWith(
                            fontSize: 20.0,
                            fontFamily: 'NunitoSemiBold',
                          )),
                      SizedBox(height: 32.0),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                      SizedBox(height: 32.0),
                      FlatButton(
                        color: kSaveButtonBackgroundColor,
                        padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                        child: Text('SAVE RESULT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2,
                                fontFamily: 'Nunito')),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        buttonTitle: 'RE-CALCULATE',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
