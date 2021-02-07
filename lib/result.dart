import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetFunction;

  String get resultPhrase {
    String resultText;

    if (score > 2) {
      resultText = 'You\'re a genious! You got 3 out of 3';
    } else if (score > 0) {
      resultText = 'Not bad!';
    } else {
      resultText = 'Did you even go to school?';
    }

    return resultText;
  }

  Result(this.score, this.resetFunction);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Restart quiz'),
          onPressed: resetFunction,
          textColor: Colors.green,
        )
      ],
    ));
  }
}
