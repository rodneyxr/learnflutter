import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue[900],
        ),
        body: SafeArea(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Ball(),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class Ball extends StatefulWidget {
  const Ball({Key key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  Random rand = Random();
  int imageNumber = 1;

  void askQuestion() {
    imageNumber = rand.nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Image.asset('images/ball$imageNumber.png'),
      onPressed: () {
        setState(() {
          askQuestion();
        });
      },
    );
  }
}
