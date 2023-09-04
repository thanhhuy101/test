class Session {
  final String name;
  final List<Lesson> lessons;

  Session(this.name, this.lessons);
}

class Lesson {
  final String name;
  double progress;

  Lesson(this.name, this.progress);
}
