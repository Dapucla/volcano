part of 'bloc.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoaded extends QuizState {
  final int currentQuestion;
  final List<String> answers;

  QuizLoaded({required this.currentQuestion, required this.answers});
}
