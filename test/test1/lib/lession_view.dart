import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/curriculum_controller.dart';

class LessonView extends StatelessWidget {
  final int sessionIndex;
  final int lessonIndex;

  LessonView(this.sessionIndex, this.lessonIndex);

  final CurriculumController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(_controller.sessions[sessionIndex].lessons[lessonIndex].name),
      ),
      body: Center(
        child: Obx(() {
          final progress =
              _controller.sessions[sessionIndex].lessons[lessonIndex].progress;
          return CircularProgressIndicator(value: progress);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Update lesson progress (for example, increment by 0.25)
          _controller.sessions[sessionIndex].lessons[lessonIndex].progress +=
              0.25;

          // Check if all lessons are completed in the session
          if (_controller.sessions[sessionIndex].lessons
              .every((lesson) => lesson.progress == 1.0)) {
            // Go to the next session if available
            if (sessionIndex < _controller.sessions.length - 1) {
              Get.toNamed('/session/${sessionIndex + 1}');
            }
          } else {
            Get.back(); // Go back to the lesson list
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
