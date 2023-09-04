import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test3/question_binding.dart';
import 'package:test3/question_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: QuestionBinding(),
      initialRoute: '/',
      getPages: [
        //GetPage(name: '/', page: () => CourseView()),
        GetPage(name: '/', page: () => QuestionView()),
      ],
    );
  }
}
