import 'package:errands/tasks/domain/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:errands/tasks/domain/entities/task_list.dart';

class TaskListProvider with ChangeNotifier {
  final List<TaskListEntity> _taskLists = [
    TaskListEntity(
      id: '1',
      name: 'To Do',
      userId: '123',
      tasks: [
        TaskEntity(
          id: '1',
          title: 'Task 1',
          description: 'Description',
          date: DateTime.now(),
          listId: '1',
          completed: false,
        ),
        TaskEntity(
          id: '2',
          title: 'Task 1',
          description: 'Description',
          date: DateTime.now(),
          listId: '1',
          completed: false,
        )
      ]
    ),
    TaskListEntity(
      id: '2',
      name: 'FInish app',
      userId: '123',
      tasks: [
        TaskEntity(
          id: '1',
          title: 'Task 1',
          description: 'Description',
          date: DateTime.now(),
          listId: '1',
          completed: false,
        )
      ]
    ),
  ];

  List<TaskListEntity> get lists => _taskLists;

  void addTaskList(TaskListEntity taskList) {
    _taskLists.add(taskList);
    notifyListeners();
  }

  void removeTaskList(TaskListEntity taskList) {
    _taskLists.remove(taskList);
    notifyListeners();
  }

  void updateTaskList(TaskListEntity taskList) {
    final index = _taskLists.indexWhere((element) => element.id == taskList.id);
    if (index != -1) {
      _taskLists[index] = taskList;
      notifyListeners();
    }
  }

  void clearTaskLists() {
    _taskLists.clear();
    notifyListeners();
  }
}