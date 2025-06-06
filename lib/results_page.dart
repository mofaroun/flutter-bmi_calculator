import 'package:bmi_calc/constants.dart';
import 'package:bmi_calc/input_page.dart';
import 'package:bmi_calc/reusableCard.dart';
import 'package:flutter/material.dart';
import 'calculatorBrain.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.interpretation,
      required this.resultText});
  final String bmiResult;
  final String interpretation;
  final String resultText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator Results",
            style: ktextSTyle,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  child: Text(
                    "Your Result",
                    textAlign: TextAlign.center,
                    style: ktitleTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: ResuableWidget(
                  colour: kactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        resultText,
                        style: kresultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBmiResultTextStyle,
                      ),
                      Text(
                        interpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                buttonTitle: "RE-CALCULATE",
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
