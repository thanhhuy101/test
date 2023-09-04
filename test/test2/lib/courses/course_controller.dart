// controllers/course_controller.dart
import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:test2/courses/course_model.dart';


class CourseController extends GetxController {
  var courses = <Course>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:8080/courses'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        courses.value = responseData
            .map((data) => Course(
                  image: data['image'],
                  logo: data['logo'],
                  name: data['name'],
                  description: data['description'],
                ))
            .toList();
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle error
    }
  }
}
