import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultedPoints;
  final VoidCallback resetHandler;

  const Result({
    super.key,
    required this.resultedPoints,
    required this.resetHandler,
  });

  String get resultPhrase {
    String resultText;
    if (resultedPoints < 0) {
      resultText = "you are apple sucker";
    } else {
      resultText = "you are the best";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,

            // there is two ways of styleing the button and here they are

            // style: TextButton.styleFrom(foregroundColor: Colors.purple),
            style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.purple)),
            child: const Text("Restart The Quiz!"),
          )
        ],
      ),
    );
  }
}
