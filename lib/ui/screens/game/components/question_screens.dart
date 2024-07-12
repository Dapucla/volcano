import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volcano/ui/widgets/buttons/continue_outline.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/ui/screens/app/app.dart';
import 'package:volcano/data/styles.dart';

import '../../types_volcanoes/screen.dart';
import '../bloc/bloc.dart';
import 'question1.dart';
import 'question2.dart';
import 'question3.dart';
import 'question4.dart';
import 'question5.dart';
import 'question6.dart';
import 'question7.dart';
import 'question8.dart';
import 'answer.dart';
class QuestionScreen extends StatelessWidget {
  final int currentQuestion;
  final List<String> answers;

  QuestionScreen({required this.currentQuestion, required this.answers});

  @override
  Widget build(BuildContext context) {
    List<Widget> questions = [
      InstructionScreen(answers: answers),
      Question1(answers: answers),
      Question2(answers: answers),
      Question3(answers: answers),
      Question4(answers: answers),
      Question5(answers: answers),
      Question6(answers: answers),
      Question7(answers: answers),
      Question8(answers: answers),
      AnswerScreen()
    ];

    return questions[currentQuestion];
  }
}

class InstructionScreen extends StatelessWidget {
  final List<String> answers;

  InstructionScreen({required this.answers});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/images/right_bg_icon.png',
                  width: MediaQuery.of(context).size.width / 4,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/attention.png',
                  // fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/left_bg_icon.png',
                  width: MediaQuery.of(context).size.width / 4,
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              DContinueButton(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const TypesVolcanoesScreen(),
                    ),
                  );
                },
                name: 'Explore types of volcanoes',
              ),
              const SizedBox(height: kDefaultPadding),
              DContinueButtonOutline(
                onTap: () {
                  context.read<QuizBloc>().add(AnswerQuestionEvent(currentQuestion: 0, answer: '', answers: answers));
                },
                name: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
