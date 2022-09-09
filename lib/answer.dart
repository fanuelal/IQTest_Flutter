import "package:flutter/material.dart";

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  //constracor
  Answer(this.selectHandler, this.answerText);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.brown,
          side: const BorderSide(color: Colors.brown)
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
