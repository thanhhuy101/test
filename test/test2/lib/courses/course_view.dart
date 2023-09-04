// views/course_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/courses/course_controller.dart';


class CourseView extends GetWidget<CourseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.courses.length,
          itemBuilder: (context, index) {
            final course = controller.courses[index];
            return ListTile(
              leading: Image.network(course.logo),
              title: Text(course.name),
              subtitle: Text(course.description),
            );
          },
        ),
      ),
    );
  }
}
