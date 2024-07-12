part of 'bloc.dart';

abstract class QuizEvent {}

class LoadQuizEvent extends QuizEvent {}

class AnswerQuestionEvent extends QuizEvent {
  final int currentQuestion;
  final String answer;
  final List<String> answers;

  AnswerQuestionEvent({
    required this.currentQuestion,
    required this.answer,
    required this.answers,
  });
}

class ResetQuizEvent extends QuizEvent {}
