import 'package:hive/hive.dart';

part 'quiz_model.g.dart';

@HiveType(typeId: 0)
class QuizState {
  @HiveField(0)
  int currentQuestion;

  QuizState({required this.currentQuestion});
}
