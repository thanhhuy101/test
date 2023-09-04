import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/chip/chip_binding.dart';
import 'package:test2/chip/chip_view.dart';
// import 'package:test2/courses/course_binhding.dart';
// import 'package:test2/courses/course_view.dart';
import 'package:test2/duolingo/duolingo_lesson_binding.dart';
import 'package:test2/duolingo/duolingo_lesson_view.dart';
import 'package:test2/test2/test2_view.dart';

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
      debugShowCheckedModeBanner: false,
      // initialBinding: CourseBinding(),
      initialBinding: ChipBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        //GetPage(name: '/', page: () => CourseView()),
        GetPage(name: '/', page: () =>  ChipView()),
      ],
    );
  }
}
