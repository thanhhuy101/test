import 'package:get/get.dart';
import 'package:collection/collection.dart';

class TestController extends GetxController {
  List<String> options = [];
  List<String> correctOrder = [];
  List<String> answer = [];
  List<String> answerPieces = [];

  RxInt score = 0.obs;
  RxDouble progress = 0.3.obs;

  @override
  void onInit() {
    super.onInit();
    updateNewQuestion();
  }

  void updateNewQuestion() {
    // Implement your logic to update options and correctOrder here
    // For example:
    options = ['This', 'is', 'a', 'sample', 'sentence'];
    correctOrder = ['This', 'is', 'a', 'sample', 'sentence'];
    answer.clear();
    answerPieces = List.from(options); // Initialize answerPieces with options
    progress.value += 0.1;
  }

  void toggleAnswerPiece(String piece) {
    if (answer.contains(piece)) {
      answer.remove(piece);
      answerPieces.add(piece);
    } else if (answerPieces.contains(piece)) {
      answerPieces.remove(piece);
      answer.add(piece);
    }
  }

  bool isAnswerCorrect() {
    return const ListEquality().equals(answer, correctOrder);
  }
}
