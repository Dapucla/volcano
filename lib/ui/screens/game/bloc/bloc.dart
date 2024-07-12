import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'event.dart';
part 'state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<LoadQuizEvent>(_onLoadQuiz);
    on<AnswerQuestionEvent>(_onAnswerQuestion);
    on<ResetQuizEvent>(_onResetQuiz); // Ensure this line is present to register the handler
  }

  void _onLoadQuiz(LoadQuizEvent event, Emitter<QuizState> emit) async {
    var box = await Hive.openBox('quizBox');
    int currentQuestion = box.get('currentQuestion', defaultValue: 0);
    List<dynamic> answersDynamic = box.get('answers', defaultValue: []);
    List<String> answers = answersDynamic.cast<String>(); // Properly cast to List<String>
    emit(QuizLoaded(currentQuestion: currentQuestion, answers: answers));
  }

  void _onAnswerQuestion(AnswerQuestionEvent event, Emitter<QuizState> emit) async {
    var box = await Hive.openBox('quizBox');
    int currentQuestion = event.currentQuestion + 1;
    List<String> answers = List.from(event.answers)..add(event.answer);
    await box.put('currentQuestion', currentQuestion);
    await box.put('answers', answers);
    emit(QuizLoaded(currentQuestion: currentQuestion, answers: answers));
  }

  void _onResetQuiz(ResetQuizEvent event, Emitter<QuizState> emit) async {
    var box = await Hive.openBox('quizBox');
    await box.delete('currentQuestion');
    await box.delete('answers');
    emit(QuizInitial());
  }
}
