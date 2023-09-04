import 'package:get/get.dart';
import 'package:test/curriculum_controller.dart';

class SessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CurriculumController());
  }
}
