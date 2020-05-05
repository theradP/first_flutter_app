import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main(){
//   runApp(Myapp());
// }
void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyappState();
  }
}

class _MyappState extends State<Myapp> {
  var _questionIndex = 0;
  var _totalscore =0;

  void _resetQuiz(){
    setState(() {
      _totalscore = 0;
      _questionIndex = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'White', 'score': 1},
        {'text': 'Blue', 'score': 2},
        {'text': 'Black', 'score': 10},
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 9},
        {'text': 'Tiger', 'score': 6},
        {'text': 'Shrew', 'score': 1},
        {'text': 'Elephant', 'score': 3},
      ],
    },
    {
      'questionText': 'Who is your favorite human?',
      'answers': [
        {'text': 'Ali', 'score': 11},
        {'text': 'Rus', 'score': 7},
        {'text': 'Snoop', 'score': 1},
        {'text': 'GoGo', 'score': 3},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
