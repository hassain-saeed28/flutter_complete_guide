import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import './question.dart';
import './main.dart';

class Answer extends StatelessWidget {
  // VoidCallback tells flutter that the function does not accept any arguments and will not return anything
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        // you give the name of the function without the () so the compiler will no excutet on compile time
        // rather you give the name only so it works as a pointer to the function
        onPressed: selectHandler,
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
        child: Text(answerText),
      ),
    );
  }
}
