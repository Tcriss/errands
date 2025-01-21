import 'dart:math';

import 'package:errands/tasks/domain/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:errands/tasks/domain/entities/task_list.dart';

class TaskProvider with ChangeNotifier {
  final List<TaskListEntity> _taskLists = [
    TaskListEntity(
      id: '1',
      name: 'To Do',
      userId: '123',
      tasks: [
        TaskEntity(
          id: '1',
          title: 'Task 1',
          description: 'Description Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus, fieri tamen permagna accessio potest, si aliquod aeternum et infinitum impendere malum nobis opinemur. Quod idem licet transferre in voluptatem, ut postea variari voluptas distinguique possit, augeri amplificarique non.',
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
          completed: true,
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

  void createList(TaskListEntity taskList) {
    _taskLists.add(taskList);
    notifyListeners();
  }

  void addTask({
    required String title,
    required String description,
    required DateTime date,
    required String listId
  }) {
    final index = _taskLists.indexWhere((list) => list.id == listId);
    if (index != -1) {
      _taskLists[index].tasks.add(TaskEntity(id: _generateUniqueId(), title: title, listId: listId));
      notifyListeners();
    }
  }

  void removeTask(TaskListEntity taskList) {
    // TODO: implement removeTask
    throw UnimplementedError();
  }

  void updateTask(TaskListEntity taskList) {
    // final index = _taskLists.indexWhere((element) => element.id == taskList.id);
    // if (index != -1) {
    //   _taskLists[index] = taskList;
    //   notifyListeners();
    // }
    // TODO: implement removeTask
    throw UnimplementedError();
  }

  //TODO: remove this method
  String _generateUniqueId() {
    final random = Random();
    final timestamp = DateTime.now().millisecondsSinceEpoch; // Current timestamp
    final randomPart = random.nextInt(1000000); // Random number up to 999,999
    return '$timestamp$randomPart';
  }
}