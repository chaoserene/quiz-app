import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function answerFunction;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerFunction,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answerText'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerFunction(answer['rightAnswer']), answer['text']);
        }).toList()
      ],
    );
  }
}
