import 'package:flutter/material.dart';
import './result.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var resultScore = 0;
  var _questionIndex = 0;
  var _questionCounter = 1;
    var _questionStringify = '';
  _MyAppState() {
    _questionStringify = '$_questionCounter/${questions.length}';
  }

  final questions = const [
    {
      'question': 'Which number should come next in the pattern?\n 10,10,20,40',
      'answer': [
        {'text': '60', 'score': 0},
        {'text': '50', 'score': 0},
        {'text': '80', 'score': 1},
        {'text': '100', 'score': 0},
      ]
    },
    {
      'question': 'Which of the following can be arranged into a 5-letter English word?',
      'answer': [
        {'text': 'H R G S T', 'score': 0},
        {'text': 'R I L S O', 'score': 0},
        {'text': 'T O O M T', 'score': 1},
        {'text': 'W Q R G S', 'score': 0},
      ]
    },
    {
      'question': 'What number best completes the analogy\n 8:4 as 10:_',
      'answer': [
        {'text': '3', 'score': 0},
        {'text': '7', 'score': 0},
        {'text': '24', 'score': 0},
        {'text': '5', 'score': 1},
      ]
    },
        {
      'question': 'You are in a dark room with a candle, a wood stove and gas lamp.If you only have one match, what do you light first?',
      'answer': [
        {'text': 'candle', 'score': 0},
        {'text': 'Gas lamp', 'score': 0},
        {'text': 'Match', 'score': 1},
        {'text': 'Wood Stove', 'score': 0},
      ]
    },
        {
      'question': 'You answer me although I never ask you questions.What am I?',
      'answer': [
        {'text': 'Parent', 'score': 0},
        {'text': 'Dog', 'score': 0},
        {'text': 'Teacher', 'score': 0},
        {'text': 'Telephone', 'score': 1},
      ]
    }
  ];
  void _answerQuestion(int score) {
    var sysmbol = '/';
    setState(() {
      resultScore += score;
      _questionIndex = _questionIndex + 1;
      _questionCounter = _questionCounter + 1;
      _questionStringify =
          _questionCounter.toString() + sysmbol + questions.length.toString();
    });
    // print(_questionIndex);
    print(resultScore);
  }

  void reseterFunc() {
    var sysmbol = '/';
    setState(() {
      _questionCounter = 1;
      _questionStringify =
          _questionCounter.toString() + sysmbol + questions.length.toString();
      resultScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.brown,
            
            title: const Text('IQ Test',
            // textAlign: TextAlign.center,),
          ),
          body: _questionIndex < questions.length
              ? Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Question(
                      questions[_questionIndex]['question'] as String,
                    ),
                    ...(questions[_questionIndex]['answer']
                            as List<Map<String, Object>>)
                        .map((answer) {
                      return Answer(
                          () => _answerQuestion(answer['score'] as int),
                          answer['text'] as String);
                    }).toList(),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                      padding: const EdgeInsets.fromLTRB(3, 15, 3, 5),
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.brown,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        _questionStringify,
                        style: const TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Result(resultScore, reseterFunc),
                )),
    );
  }
}
