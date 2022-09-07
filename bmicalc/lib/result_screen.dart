import 'package:bmicalc/bmi.dart';
import 'package:bmicalc/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmicalc/constants.dart';

class ResultScreen extends StatelessWidget {
  // final int bmiResult;
  // final String userResult;
  // final String userMessage;
  // final BMI bmi;

  const ResultScreen({
    Key? key,
    // required this.bmi,
    // required this.bmiResult,
    // required this.userResult,
    // required this.userMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BMI bmi = ModalRoute.of(context)!.settings.arguments as BMI;
    final double bmiResult = bmi.getBMI();
    final String userResult = bmi.getOverUnder();
    final String userMessage = bmi.getInterpretation();

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 32.0),
            child: Text(
              'Your Result',
              style: kBoldLabelTextStyle,
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kLightCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    userResult,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 128,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      userMessage,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            color: kBottomButtonColor,
            height: kBottomButtonHeight,
            child: const Text(
              'RE-CALCULATE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
