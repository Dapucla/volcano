import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volcano/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:volcano/data/styles.dart';

import '../../../widgets/textfield.dart';
import '../../../widgets/border.dart';
import '../bloc/bloc.dart';

class Question1 extends StatefulWidget {
  final List<String> answers;

  Question1({required this.answers});

  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  final TextEditingController _controllerC = TextEditingController();
  final TextEditingController _controllerD = TextEditingController();

  String getVolcanoType(String number) {
    switch (number) {
      case '1':
        return 'Shield Volcano';
      case '2':
        return 'Supervolcano/Caldera';
      case '3':
        return 'Cinder Cone/Scoria Cone';
      case '4':
        return 'Composite Volcano';
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
                          "1. Look at the pictures below and match each volcano type with its corresponding image.",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: kDefaultPadding / 2),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text("A"),
                                  Image.asset("assets/images/quiz_1.png"),
                                ],
                              ),
                            ),
                            const SizedBox(width: kDefaultPadding),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("C"),
                                  Image.asset("assets/images/quiz_3.png"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text("B"),
                                  Image.asset("assets/images/quiz_4.png"),
                                ],
                              ),
                            ),
                            const SizedBox(width: kDefaultPadding),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("D"),
                                  Image.asset("assets/images/quiz_2.png"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Text(
                          "1. Shield Volcano \n"
                              "2. Supervolcano/Caldera \n"
                              "3. Cinder Cone/Scoria Cone \n"
                              "4. Composite Volcano \n",
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
                          controller: _controllerA,
                          hintText: "A - ?",
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: CustomTextField(
                          controller: _controllerB,
                          hintText: "B - ?",
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: CustomTextField(
                          controller: _controllerC,
                          hintText: "C - ?",
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: CustomTextField(
                          controller: _controllerD,
                          hintText: "D - ?",
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 4),
                  Center(
                    child: Text(
                      '*enter a number',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  DContinueButton(
                    onTap: () {
                      String answerA = getVolcanoType(_controllerA.text);
                      String answerB = getVolcanoType(_controllerB.text);
                      String answerC = getVolcanoType(_controllerC.text);
                      String answerD = getVolcanoType(_controllerD.text);

                      String answer = "Picture A: $answerA, \n"
                          "Picture B: $answerB, \n"
                          "Picture C: $answerC, \n"
                          "Picture D: $answerD";

                      context.read<QuizBloc>().add(AnswerQuestionEvent(
                        currentQuestion: 1,
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
