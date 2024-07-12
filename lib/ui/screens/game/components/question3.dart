import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:volcano/data/styles.dart';

import '../../../widgets/textfield.dart';
import '../../../widgets/border.dart';
import '../bloc/bloc.dart';

class Question3 extends StatefulWidget {
  final List<String> answers;

  Question3({required this.answers});

  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  final TextEditingController _controller = TextEditingController();

  String formatAnswer(String answer) {
    switch (answer.toLowerCase()) {
      case 'a':
        return 'Picture A: Composite Volcano';
      case 'b':
        return 'Picture B: Shield Volcano';
      case 'c':
        return 'Picture C: Cinder Cone';
      case 'd':
        return 'Picture D: Supervolcano';
      default:
        return 'Invalid';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: kBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3. Picture Identification: Identify the type of volcano shown in the picture below:",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Center(
                          child: Image.asset(
                            "assets/images/quiz_6.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Text(
                          "a) Composite Volcano \n"
                              "b) Shield Volcano \n"
                              "c) Cinder Cone \n"
                              "d) Supervolcano \n",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding, bottom: kDefaultPadding),
              child: Column(
                children: [
                  CustomTextField(
                    controller: _controller,
                    hintText: 'Your answer',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-dA-D]')),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 4),
                  Center(
                    child: Text(
                      '*enter a letter',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  DContinueButton(
                    onTap: () {
                      String answer = _controller.text.isEmpty
                          ? "No answer"
                          : formatAnswer(_controller.text);
                      context.read<QuizBloc>().add(AnswerQuestionEvent(
                        currentQuestion: 3,
                        answer: answer,
                        answers: widget.answers,
                      ));
                    },
                    name: "Next Question",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
