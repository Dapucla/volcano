import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:volcano/data/styles.dart';

import '../../../widgets/textfield.dart';
import '../../../widgets/border.dart';
import '../bloc/bloc.dart';

class Question7 extends StatefulWidget {
  final List<String> answers;

  Question7({required this.answers});

  @override
  _Question7State createState() => _Question7State();
}

class _Question7State extends State<Question7> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String mapAnswerToVolcanoType(String answer) {
    switch (answer.toUpperCase()) {
      case 'A':
        return 'Composite Volcano';
      case 'B':
        return 'Shield Volcano';
      case 'C':
        return 'Cinder Cone';
      case 'D':
        return 'Supervolcano';
      default:
        return 'No answer';
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
                          "7. Picture Identification: Identify the type of volcano shown in the picture below:",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Center(
                          child: Image.asset(
                            "assets/images/quiz_9.png",
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _controller1,
                          hintText: "Your answer",
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-dA-D]')),
                          ],
                        ),
                      ),
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
                      String answer = _controller1.text.trim();
                      String mappedAnswer = mapAnswerToVolcanoType(answer);
                      context.read<QuizBloc>().add(AnswerQuestionEvent(
                        currentQuestion: 7,
                        answer: mappedAnswer,
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
