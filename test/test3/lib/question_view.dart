import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test3/question_controller.dart';

class QuestionView extends GetView<QuestionController> {
   QuestionView({super.key});
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
            TextFormField(
              onChanged: (value) {
                // Listen to the input changes
                controller.isCorrectAnswer.value = false;
              },
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
