import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/lession_view.dart';
import 'package:test/session_view.dart';

import 'session_binding.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: SessionBinding(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return GetPageRoute(
            page: () => SessionView(0),
          );
        } else if (settings.name!.startsWith('/session')) {
          final sessionIndex = int.parse(settings.name!.split('/')[2]);
          return GetPageRoute(
            page: () => SessionView(sessionIndex),
          );
        } else if (settings.name!.startsWith('/lesson')) {
          final parts = settings.name!.split('/');
          final sessionIndex = int.parse(parts[2]);
          final lessonIndex = int.parse(parts[3]);
          return GetPageRoute(
            page: () => LessonView(sessionIndex, lessonIndex),
          );
        }
        return null;
      },
    );
  }
}
