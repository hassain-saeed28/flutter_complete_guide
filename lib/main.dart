import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

//  you can write functions with one expression  like this this is the same as the above one
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyAppState();
  }
}

// for statfulWidget we need two class to implementet also we need State method wich return
// our second class that has the imformation that can be changed

// the _ makes the any thing inside the class private
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "what is your favorite system",
      "answers": [
        {"text": "android", "points": 1069},
        {"text": "IOS", "points": -100000},
        {"text": "wendose", "points": 1000}
      ],
    },
    {
      "questionText": "what do you prefer to use native or",
      "answers": [
        {"text": "native", "points": 300},
        {"text": "cross-platform", "points": 150}
      ],
    },
    {
      "questionText": "what do you love",
      "answers": [
        {"text": "mew", "points": 1000},
        {"text": "woof woof", "points": 0}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalPoints = 0;

  void _reaetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalPoints = 0;
    });
  }

  void _answerQuestion(int point) {
    _totalPoints += point;

    setState(
      () {
        _questionIndex++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "my First App",
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                resultedPoints: _totalPoints,
                resetHandler: _reaetQuiz,
              ),
      ),
    );
  }
}
