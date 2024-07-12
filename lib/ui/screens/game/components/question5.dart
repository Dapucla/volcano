import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:volcano/data/styles.dart';

import '../../../widgets/textfield.dart';
import '../../../widgets/border.dart';
import '../bloc/bloc.dart';

class Question5 extends StatefulWidget {
  final List<String> answers;

  Question5({required this.answers});

  @override
  _Question5State createState() => _Question5State();
}

class _Question5State extends State<Question5> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String formatAnswer(String answer) {
    if (answer.toLowerCase() == 'a' || answer.toLowerCase() == 'b') {
      return answer.toUpperCase();
    }
    return 'Invalid';
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
                          "5. Picture Identification: Match the picture with the correct volcano type:",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text("A"),
                                  Image.asset("assets/images/quiz_7.png"),
                                ],
                              ),
                            ),
                            const SizedBox(width: kDefaultPadding),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("B"),
                                  Image.asset("assets/images/quiz_8.png"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            'assets/images/right_bg_icon.png',
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/images/left_bg_icon.png',
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                        ),
                        Text(
                          "- Cinder Cone \n"
                              "- Supervolcano \n",
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
                          hintText: "Cinder Cone - ?",
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[aAbB]')),
                          ],
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: CustomTextField(
                          controller: _controller2,
                          hintText: "Supervolcano - ?",
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[aAbB]')),
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
                      String answer1 = _controller1.text.isEmpty
                          ? "No answer"
                          : formatAnswer(_controller1.text);
                      String answer2 = _controller2.text.isEmpty
                          ? "No answer"
                          : formatAnswer(_controller2.text);

                      String combinedAnswer =
                          "Cinder Cone Picture: $answer1, \nSupervolcano Picture: $answer2";
                      context.read<QuizBloc>().add(AnswerQuestionEvent(
                        currentQuestion: 5,
                        answer: combinedAnswer,
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
