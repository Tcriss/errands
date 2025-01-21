import 'package:errands/tasks/presentation/providers/list-provider.dart';
import 'package:errands/tasks/presentation/widgets/task-list-tile.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final taskListProvider = TaskListProvider();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
        centerTitle: false,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            itemCount: taskListProvider.lists.length,
            itemBuilder: (_, index) => Column(
              children: [
                TaksListTile(list: taskListProvider.lists[index]),
                SizedBox(height: 10.0),
              ],
            )
      ),
    );
  }
}
