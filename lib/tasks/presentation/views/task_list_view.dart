import 'package:errands/tasks/presentation/providers/task_provider.dart';
import 'package:errands/tasks/presentation/widgets/add_task_modal.dart';
import 'package:errands/tasks/presentation/widgets/task_list_tile.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatelessWidget {
  final _taskProvider = TaskProvider();

  TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
        centerTitle: false,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          itemCount: _taskProvider.lists.length,
          itemBuilder: (_, index) => Column(
                children: [
                  TaksListTile(list: _taskProvider.lists[index]),
                  SizedBox(height: 10.0),
                ],
              )),
      floatingActionButton: AddTaskModal()
    );
  }
}
