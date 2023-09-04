import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/duolingo/duolingo_lesson_controller.dart';

class QuestionView extends GetView<QuestionController> {
  final TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Duolingo-like Quiz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller
                  .questions[controller.currentQuestionIndex.value].question,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 80,
              child: TextFormField(
                controller: _answerController,
                onChanged: (value) {
                  // Listen to the input changes
                  controller.isCorrectAnswer.value = false;
                },
                style: const TextStyle(
                    color: Color.fromARGB(255, 27, 26, 26)), // Set text color
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10), // Set horizontal padding
                  fillColor: Color.fromARGB(255, 195, 193, 198), // Set background color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set border radius
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 229, 6, 17),
                        width: 2.0), // Remove border
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.checkAnswer(_answerController.text);
                if (controller.isCorrectAnswer.value) {
                  controller.nextQuestion();
                }
              },
              style: ElevatedButton.styleFrom(
                primary: controller.isCorrectAnswer.value
                    ? Colors.green
                    : Colors.red,
              ),
              child: Text(
                controller.isCorrectAnswer.value ? 'Next Question' : 'Submit',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: controller.progressBarValue.value,
              minHeight: 20,
            ),
          ],
        ),
      ),
    );
  }
}
