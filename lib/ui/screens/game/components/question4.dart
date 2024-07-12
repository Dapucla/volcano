import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:volcano/data/styles.dart';

import '../../../widgets/textfield.dart';
import '../../../widgets/border.dart';
import '../bloc/bloc.dart';

class Question4 extends StatefulWidget {
  final List<String> answers;

  Question4({required this.answers});

  @override
  _Question4State createState() => _Question4State();
}

class _Question4State extends State<Question4> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String formatAnswer(String answer) {
    switch (answer.toLowerCase()) {
      case 'a':
        return 'a) Steep sides';
      case 'b':
        return 'b) Broad base and gently sloped sides';
      case 'c':
        return 'c) Explosive eruptions';
      case 'd':
        return 'd) Small and short-lived';
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
                          "4. Multiple Choice: What is the main characteristic of shield volcanoes?",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: kDefaultPadding),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Center(
                              child: Image.asset(
                                "assets/images/quiz_5.png",
                                width: constraints.maxWidth * 0.7,
                                height: constraints.maxWidth * 0.7,
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Text(
                          "a) Steep sides \n"
                              "b) Broad base and gently sloped sides \n"
                              "c) Explosive eruptions \n"
                              "d) Small and short-lived \n",
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
                          controller: _controller1,
                          hintText: "Your answer",
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-dA-D]')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 4),
                  Center(
                    child: Text(
                      '*enter a letter',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  DContinueButton(
                    onTap: () {
                      String answer = _controller1.text.isEmpty
                          ? "No answer"
                          : formatAnswer(_controller1.text);
                      context.read<QuizBloc>().add(AnswerQuestionEvent(
                        currentQuestion: 4,
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
