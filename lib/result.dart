import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetFunction;
  Result(this.resultScore, this.resetFunction);
  String get resultText {
    var result = 'you did it';
    if (resultScore > 2) {
      return result = 'Well done! You scored: $resultScore';
    } else {
      return result = 'Low Score! You scored: $resultScore';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 250, 5, 10),
            child: Text(
              resultText,
              style: const TextStyle(
                  fontSize: 36, fontStyle: FontStyle.italic, color: Colors.brown),
              textAlign: TextAlign.center,
            ),
          ),
          OutlinedButton(
            child: Text('Restart'),
            onPressed: resetFunction,
            style: OutlinedButton.styleFrom(
                primary: Colors.brown,
                side: const BorderSide(color: Colors.brown)),
          )
        ],
      ),
    );
  }
}
