import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/curriculum_controller.dart';


class SessionView extends StatelessWidget {
  final int sessionIndex;

  SessionView(this.sessionIndex);

  final CurriculumController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_controller.sessions[sessionIndex].name),
      ),
      body: ListView.builder(
        itemCount: _controller.sessions[sessionIndex].lessons.length,
        itemBuilder: (context, lessonIndex) {
          final lesson = _controller.sessions[sessionIndex].lessons[lessonIndex];
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(lesson.name),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Stack(
                    children: [
                      CircularProgressIndicator(
                        value: lesson.progress,
                        strokeWidth: 3,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      Center(
                        child: Text(
                          lesson.progress > 0 ? '${(lesson.progress * 100).toInt()}%' : '0%',
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () => Get.toNamed('/lesson/$sessionIndex/$lessonIndex'),
          );
        },
      ),
    );
  }
}
