import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'components/question_screens.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizInitial) {
            context.read<QuizBloc>().add(LoadQuizEvent());
            return Center(child: CircularProgressIndicator());
          } else if (state is QuizLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text(_getAppBarTitle(state.currentQuestion)),
              ),
              body: QuestionScreen(
                currentQuestion: state.currentQuestion,
                answers: state.answers,
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Quiz'),
              ),
              body: Center(child: Text('Something went wrong!')),
            );
          }
        },
      ),
    );
  }

  String _getAppBarTitle(int currentQuestion) {
    switch (currentQuestion) {
      case 0:
        return "Play";
      case 1:
        return "1st Question";
      case 2:
        return "2nd Question";
      case 3:
        return "3rd Question";
      case 4:
        return "4th Question";
      case 5:
        return "5th Question";
      case 6:
        return "6th Question";
      case 7:
        return "7th Question";
      case 8:
        return "8th Question";
      case 9:
        return "Your Answers";
      default:
        return "Quiz";
    }
  }
}
