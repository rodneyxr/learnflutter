import 'package:bmicalc/constants.dart';
import 'package:flutter/material.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

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
  int userHeight = 55;
  int userWeight = 150;
  int userAge = 35;

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
                          ? kSelectedCardColor
                          : kLightCardColor,
                      child: const IconContent(
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
                            ? kSelectedCardColor
                            : kLightCardColor,
                        child: const IconContent(
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
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kLightCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('HEIGHT', style: kLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$userHeight',
                              style: kBoldLabelTextStyle,
                            ),
                            const Text('in.'),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 2,
                            trackShape: const RoundedRectSliderTrackShape(),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            overlayColor: kBottomButtonColor.withAlpha(50),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30,
                            ),
                            thumbColor: kBottomButtonColor,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15,
                            ),
                          ),
                          child: Slider(
                            min: 12,
                            max: 100,
                            value: userHeight.toDouble(),
                            onChanged: (value) => setState(
                              () => userHeight = value.round(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kLightCardColor,
                    child: CounterWidget(
                      label: 'WEIGHT',
                      value: userWeight,
                      units: 'lbs.',
                      valueChanged: (value) =>
                          setState(() => {userWeight = value}),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kLightCardColor,
                    child: CounterWidget(
                      label: 'AGE',
                      value: userAge,
                      units: 'yrs.',
                      valueChanged: (value) => setState(
                        () => {userAge = value},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomButtonColor,
            margin: const EdgeInsets.only(top: 15.0),
            width: double.infinity,
            height: kBottomButtonHeight,
            child: const Center(
              child: Text('CALCULATE YOUR BMI'),
            ),
          ),
        ],
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  String? label;
  String? units;
  int value;
  Function(int)? valueChanged;

  CounterWidget(
      {Key? key,
      this.label,
      this.units,
      required this.value,
      this.valueChanged})
      : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (widget.label != null) Text(widget.label!, style: kLabelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '${widget.value}',
              style: kBoldLabelTextStyle,
            ),
            if (widget.units != null) Text(widget.units!)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SimpleCircleButton(
              onPressed: () => {
                if (widget.valueChanged != null)
                  widget.valueChanged!(widget.value - 1)
              },
              icon: Icons.remove,
            ),
            SimpleCircleButton(
              onPressed: () => {
                if (widget.valueChanged != null)
                  widget.valueChanged!(widget.value + 1)
              },
              icon: Icons.add,
            ),
          ],
        ),
      ],
    );
  }
}

class SimpleCircleButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;

  const SimpleCircleButton(
      {Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: const CircleBorder(),
      fillColor: Colors.deepOrange,
      hoverColor: Colors.deepOrangeAccent,
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
