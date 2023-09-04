import 'package:get/get.dart';
import 'package:test2/duolingo/duolingo_lesson_controller.dart';


class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(() => QuestionController());
  }
}
