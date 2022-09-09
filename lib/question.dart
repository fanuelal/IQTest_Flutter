import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
    
    Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 200,
      decoration:  const BoxDecoration(
        color: Colors.brown,
      borderRadius:   BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      )),
      
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 28,color: Colors.white),
        textAlign: TextAlign.center,
      ),
      
    );
  }
}

