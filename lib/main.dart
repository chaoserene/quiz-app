import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  var _questions = [
    {
      'questionText': 'What\'s the capital of Canada?',
      'answerText': [
        {'text': 'Ottawa', 'rightAnswer': true},
        {'text': 'Toronto', 'rightAnswer': false},
        {'text': 'Vancouver', 'rightAnswer': false},
        {'text': 'Quebec', 'rightAnswer': false}
      ]
    },
    {
      'questionText': 'What\'s the capital of Brazil?',
      'answerText': [
        {'text': 'São Paulo', 'rightAnswer': false},
        {'text': 'Rio de Janeiro', 'rightAnswer': false},
        {'text': 'Brasília', 'rightAnswer': true},
        {'text': 'Salvador', 'rightAnswer': false}
      ]
    },
    {
      'questionText': 'What\'s the capital of The United States?',
      'answerText': [
        {'text': 'New York City', 'rightAnswer': false},
        {'text': 'Los Angeles', 'rightAnswer': false},
        {'text': 'Washington D.C.', 'rightAnswer': true},
        {'text': 'Miami', 'rightAnswer': false}
      ]
    }
  ];

  void _answerQuestion(bool rightQuestion) {
    if (rightQuestion) _totalScore = _totalScore + 1;

    setState(() {
      if (_questionIndex < _questions.length)
        _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.green,
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questionIndex: _questionIndex,
              questions: _questions,
              answerFunction: _answerQuestion,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
