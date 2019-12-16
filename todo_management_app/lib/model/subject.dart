import 'package:flutter/material.dart';
import 'package:todo_management_app/model/task.dart';

class Subject {
  String titleText;
  String aboutText;
  Color color;

  List<Task> tasks = [];

  Subject({this.titleText, this.aboutText, this.color});
}
