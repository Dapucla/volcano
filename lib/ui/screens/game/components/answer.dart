import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volcano/ui/widgets/buttons/continue_outline.dart';
import 'package:volcano/data/styles.dart';
import '../bloc/bloc.dart';

class AnswerScreen extends StatelessWidget {
  final List<String> correctAnswers = [
    "Picture A: Composite Volcano,Picture B: Shield Volcano,Picture C: Cinder Cone/Scoria Cone,Picture D: Supervolcano/Caldera",
    "False",
    "Picture B: Shield Volcano",
    "b) Broad base and gently sloped sides",
    "Cinder Cone Picture: A,Supervolcano Picture: B",
    "False",
    "Composite Volcano",
    "b) Rare but incredibly powerful eruptions"
  ];

  final List<String> questionTitles = [
    "1. Picture Identification: Look at the pictures below and match each volcano type with its corresponding image.",
    "2. The Mauna Loa Volcano in Hawaii is an example of a composite volcano.",
    "3. Picture Identification:",
    "4. What is the main characteristic of shield volcanoes?",
    "5. Match the picture with the correct volcano type:",
    "6. Cinder cones are the smallest volcanic landforms and are composed of layers of ash and lava.",
    "7. Identify the type of volcano shown in the picture below:",
    "8. What makes supervolcanoes different from other types of volcanoes?",
    ""
  ];

  List<InlineSpan> _formatAnswer(String userAnswer, String correctAnswer) {
    List<InlineSpan> textSpans = [];
    List<String> userParts = userAnswer.split(',');
    List<String> correctParts = correctAnswer.split(',');

    for (int i = 0; i < userParts.length; i++) {
      bool isCorrect = userParts[i].trim().toLowerCase() == correctParts[i].trim().toLowerCase();
      textSpans.add(TextSpan(
        text: '${userParts[i]} ',
        style: TextStyle(
          color: isCorrect ? Colors.green : Colors.red,
        ),
      ));
      if (!isCorrect) {
        textSpans.add(TextSpan(
          text: '\n(${correctParts[i]})',
          style: TextStyle(
            color: Colors.green,
          ),
        ));
      }
    }

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizLoaded) {
            return SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/bg_icons.png',
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.answers.length,
                          itemBuilder: (context, index) {
                            if (index == 0) return Container(); // Skip the first element
                            String userAnswer = state.answers[index];
                            String correctAnswer = correctAnswers[index - 1]; // Adjust for skipped element

                            return ListTile(
                              title: Text('${questionTitles[index - 1]}\n'), // Adjust for skipped element
                              subtitle: RichText(
                                text: TextSpan(
                                  children: _formatAnswer(userAnswer, correctAnswer),
                                  style: DefaultTextStyle.of(context).style,
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: DContinueButtonOutline(
                            onTap: () {
                              context.read<QuizBloc>().add(ResetQuizEvent());
                              Navigator.pop(context);
                            },
                            name: "Exit",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No answers to display'));
          }
        },
      ),
    );
  }
}
