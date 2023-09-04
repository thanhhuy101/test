import 'package:get/get.dart';
import 'package:test2/duolingo/question_model.dart';


class QuestionController extends GetxController {
  var questions = <QuestionModel>[
    QuestionModel(
      question: 'This is a ___.',
      correctAnswer: 'pen',
    ),
    QuestionModel(
      question: 'She is reading a ___.',
      correctAnswer: 'book',
    ),
    // Thêm các câu hỏi khác vào đây
  ];

  var currentQuestionIndex = 0.obs;
  var isCorrectAnswer = false.obs;
  var progressBarValue = 0.0.obs;

  void checkAnswer(String answer) {
    if (answer.toLowerCase() == questions[currentQuestionIndex.value].correctAnswer.toLowerCase()) {
      isCorrectAnswer.value = true;
      progressBarValue.value += 1.0 / questions.length;
    } else {
      isCorrectAnswer.value = false;
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value += 1;
      isCorrectAnswer.value = false;
    }
  }
}
