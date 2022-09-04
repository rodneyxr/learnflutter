import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, bool>> questions = [
    {'Question 1 is true': true},
    {'Question 2 is false': false},
    {'Question 3 is true': true},
    {'Question 4 is false': false},
    {'Question 5 is true': true},
    {'Question 6 is false': false},
    {'Question 7 is true': true},
    {'Question 8 is false': false},
    {'Question 9 is true': true},
    {'Question 10 is false': false},
  ];
  int currentQuestion = 0;
  List<Widget> progressIcons = [];

  void updateQuestion(bool answer) {
    setState(() {
      if (answer == questions[currentQuestion].values.first) {
        progressIcons.add(Icon(Icons.check, color: Colors.green));
      } else {
        progressIcons.add(Icon(Icons.close, color: Colors.red));
      }
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[currentQuestion].keys.first,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                updateQuestion(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                updateQuestion(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: progressIcons,
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
