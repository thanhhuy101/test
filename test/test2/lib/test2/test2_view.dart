

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/test2/test2_controller.dart';

class TestView extends StatelessWidget {
  final TestController controller = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duolingo Clone'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Logic for exiting the lesson
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Translate the following sentence:',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              controller.options.join(' '),
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              for (var option in controller.options)
                GestureDetector(
                  onTap: () {
                    controller.toggleAnswerPiece(option);
                  },
                  child: Chip(
                    label: Text(option),
                    backgroundColor: controller.answerPieces.contains(option)
                        ? Color.fromARGB(255, 186, 231, 87)
                        : const Color.fromARGB(255, 19, 194, 13),
                  ),
                ),
            ],
          ),
          const Divider(), // Divider to separate answer area and answer pieces
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (var option in controller.answer)
                  GestureDetector(
                    onTap: () {
                      controller.toggleAnswerPiece(option);
                    },
                    child: Chip(
                      label: Text(option),
                      backgroundColor: Colors.blue,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              controller.updateNewQuestion();
            },
            child: const Text('Next Question'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.isAnswerCorrect()) {
                // Handle correct answer logic
              }
            },
            style: ElevatedButton.styleFrom(
              primary: controller.isAnswerCorrect() ? Colors.green : Colors.red,
            ),
            child: const Text('Check Answer'),
          ),
          Obx(() => Container(
                padding: const EdgeInsets.all(16.0),
                child: LinearProgressIndicator(
                  value: controller.progress.value,
                ),
              )),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() => Text(
                  'Score: ${controller.score.value}',
                  style: const TextStyle(fontSize: 18.0),
                )),
          ),
        ],
      ),
    );
  }
}
