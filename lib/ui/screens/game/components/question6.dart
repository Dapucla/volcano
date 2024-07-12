import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:volcano/data/styles.dart';
import 'package:volcano/ui/widgets/textfield.dart';

import '../../../widgets/border.dart';
import '../bloc/bloc.dart';

class Question6 extends StatefulWidget {
  final List<String> answers;

  Question6({required this.answers});

  @override
  _Question6State createState() => _Question6State();
}

class _Question6State extends State<Question6> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String formatAnswer(String answer) {
    if (answer.toLowerCase() == 'true') {
      return 'True';
    } else if (answer.toLowerCase() == 'false') {
      return 'False';
    }
    return 'No answer';
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
                          "6. Cinder cones are the smallest volcanic landforms and are composed of layers of ash and lava. (True/False)",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Center(
                          child: Image.asset(
                            "assets/images/quiz_5.png",
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.width * 0.7,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding),
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 4),
                  Center(
                    child: Text(
                      '*enter True or False',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  DContinueButton(
                    onTap: () {
                      String answer = _controller1.text.trim();
                      answer = formatAnswer(answer);
                      context.read<QuizBloc>().add(AnswerQuestionEvent(
                        currentQuestion: 6,
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
