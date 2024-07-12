import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:volcano/data/styles.dart';

import '../../../widgets/textfield.dart';
import '../../../widgets/border.dart';
import '../bloc/bloc.dart';

class Question8 extends StatefulWidget {
  final List<String> answers;

  Question8({required this.answers});

  @override
  _Question8State createState() => _Question8State();
}

class _Question8State extends State<Question8> {
  final TextEditingController _controller = TextEditingController();

  List<String> mapAnswersToDescriptions(String answers) {
    List<String> descriptions = [];
    for (var answer in answers.split(',')) {
      switch (answer.trim().toUpperCase()) {
        case 'A':
          descriptions.add('a) Small size');
          break;
        case 'B':
          descriptions.add('b) Rare but incredibly powerful eruptions');
          break;
        case 'C':
          descriptions.add('c) Steep sides');
          break;
        case 'D':
          descriptions.add('d) Non-explosive eruptions');
          break;
        default:
          descriptions.add('No answer');
      }
    }
    return descriptions;
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
                          "8. Multiple Choice: What makes supervolcanoes different from other types of volcanoes?",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Align(
                          child: Image.asset(
                            "assets/images/quiz_5.png",
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.width * 0.6,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Text(
                          "a) Small size \n"
                              "b) Rare but incredibly powerful eruptions \n"
                              "c) Steep sides \n"
                              "d) Non-explosive eruptions \n",
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _controller,
                          hintText: "Your answer (comma-separated)",
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-dA-D,]')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 4),
                  Center(
                    child: Text(
                      '*enter letters separated by commas',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  DContinueButton(
                    onTap: () {
                      String answer = _controller.text.trim();
                      List<String> mappedAnswers = mapAnswersToDescriptions(answer);
                      String combinedAnswers = mappedAnswers.join(' ');
                      context.read<QuizBloc>().add(AnswerQuestionEvent(
                        currentQuestion: 8,
                        answer: combinedAnswers,
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
