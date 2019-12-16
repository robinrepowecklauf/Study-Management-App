class Task {
  String titleText;
  DateTime deadline;
  bool isCompleted;

  List<Task> unfinishedTasks = [];
  List<Task> finishedTasks = [];

  Task({this.titleText, this.deadline, this.isCompleted});
}
