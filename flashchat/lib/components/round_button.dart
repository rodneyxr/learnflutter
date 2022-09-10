import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key, this.text, this.color, required this.onPressed})
      : super(key: key);

  final String? text;
  final Color? color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text ?? '',
          ),
        ),
      ),
    );
  }
}
