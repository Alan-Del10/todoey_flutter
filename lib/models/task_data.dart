import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  List<Task> _tasks = [
    Task(name: 'Tarea 1')
  ];

  int get taskCount => _tasks.length;

  int get taskCheckedCount => _tasks.where((task) => task.isDone == true).length;

  int get taskUncheckedCount => _tasks.where((task) => task.isDone == false).length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String newTaskTitle) {
    final task = Task(name:  newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }
  void checkTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}