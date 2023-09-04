// bindings/course_binding.dart
import 'package:get/get.dart';
import 'package:test2/courses/course_controller.dart';


class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseController());
  }
}
