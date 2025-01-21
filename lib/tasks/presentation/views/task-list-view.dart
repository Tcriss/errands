import 'dart:math';

import 'package:errands/core/common/widgets/custom_input.dart';
import 'package:errands/tasks/domain/entities/task.dart';
import 'package:errands/tasks/presentation/providers/task-provider.dart';
import 'package:errands/tasks/presentation/widgets/task-list-tile.dart';
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addTask(context),
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _addTask(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    String listId = '';

    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16.0,
            children: [
              CustomInput(
                placeHolder: 'Task name',
                controller: titleController,
              ),
              CustomInput(
                placeHolder: 'Description',
                controller: descController,
              ),
              Row(
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('Schedule'),
                    onPressed: () {
                      //TODO: implement scehdule method
                    },
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    onSelected: (value) => listId = value,
                    borderRadius: BorderRadius.circular(12.0),
                    position: PopupMenuPosition.over,
                    icon: const Icon(Icons.menu),
                    // child: Row(
                    //   spacing: 10.0,
                    //   children: [
                    //     Icon(Icons.list, color: Colors.blue.shade800),
                    //     Text('Select list', style: TextStyle(color: Colors.blue.shade800),),
                    //   ],
                    // ),
                    itemBuilder: (_) => _taskProvider.lists.map((list) => 
                      PopupMenuItem(
                        value: list.id,
                        child: Text(list.name),
                      )).toList()
                  ),
                  IconButton(
                    icon: const Icon(Icons.alarm),
                    onPressed: () {
                      //TODO: implement reminders methods
                    },
                  ),
                ],
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Add To-Do',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                onPressed: () {
                  _taskProvider.addTask(TaskEntity(
                    id: _generateUniqueId(),
                    title: titleController.text,
                    description: descController.text,
                    date: DateTime.now(),
                    listId: '',
                  ));
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  //TODO: remove this method
  String _generateUniqueId() {
    final random = Random();
    final timestamp = DateTime.now().millisecondsSinceEpoch; // Current timestamp
    final randomPart = random.nextInt(1000000); // Random number up to 999,999
    return '$timestamp$randomPart';
  }
}
