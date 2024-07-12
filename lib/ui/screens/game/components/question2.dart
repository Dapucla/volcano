import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/data/styles.dart';

import '../../../widgets/border.dart';
import '../../../widgets/textfield.dart';
import '../bloc/bloc.dart';

class Question2 extends StatefulWidget {
  final List<String> answers;

  Question2({required this.answers});

  @override
  _Question2State createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  final TextEditingController _controller = TextEditingController();

  String formatAnswer(String answer) {
    if (answer.toLowerCase() == 'true') {
      return 'True';
    } else if (answer.toLowerCase() == 'false') {
      return 'False';
    }
    return answer;
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "2. The Mauna Loa Volcano in Hawaii is an example of a composite volcano. (True/False)",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Image.asset(
                          "assets/images/quiz_5.png",
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.width * 0.7,
                          fit: BoxFit.contain,
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
                  const SizedBox(height: kDefaultPadding / 2),
                  CustomTextField(
                    controller: _controller,
                    hintText: "Your answer",
                  ),
                  const SizedBox(height: kDefaultPadding / 4),
                  Center(
                    child: Text(
                      '*enter True or False',
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
                        currentQuestion: 2,
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
