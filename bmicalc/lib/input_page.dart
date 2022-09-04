import 'package:flutter/material.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const Color lightCardColor = Color(0xFF1D1E33);
const Color bottomButtonColor = Color(0xFFEB1555);
const Color selectCardColor = Colors.blueGrey;
const double bottomButtonHeight = 80.0;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? selectCardColor
                          : lightCardColor,
                      child: IconContent(
                        icon: Icons.male,
                        title: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                        color: selectedGender == Gender.female
                            ? selectCardColor
                            : lightCardColor,
                        child: IconContent(
                          icon: Icons.female,
                          title: 'FEMALE',
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    color: lightCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    color: lightCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: lightCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomButtonColor,
            margin: const EdgeInsets.only(top: 15.0),
            width: double.infinity,
            height: bottomButtonHeight,
            child: const Center(
              child: Text('CALCULATE YOUR BMI'),
            ),
          ),
        ],
      ),
    );
  }
}
