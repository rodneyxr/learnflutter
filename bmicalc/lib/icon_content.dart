import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData? icon;
  final String? title;

  const IconContent({
    Key? key,
    this.icon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 128,
        ),
        Text(
          title ?? '',
          style: TextStyle(
            fontSize: 25,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
