import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    // super.key,
    required this.answerQuestion,
    required this.questions,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]["questionText"] as String,
        ),
        /* 
            the code snippet below is going to make a list of widgets for each answer in each question in each map in the questions list 

            the map function returns the list of widgets 
            which will be added to the children list in the column but the problem is that you cannot add
            a list to a list so the solution is by using the spread operator which is ... 

            this operator will add the values of the returned list from the map function to the children's list 

            basally the ... takes a list and pulls the element out of it and then adds them to the
            surrounding list as individual values  
            */
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer["points"]), answer["text"] as String);
        }).toList()
      ],
    );
  }
}
