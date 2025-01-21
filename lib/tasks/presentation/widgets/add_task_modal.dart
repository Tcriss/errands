import 'package:errands/core/common/widgets/custom_input.dart';
import 'package:errands/tasks/presentation/providers/task_provider.dart';
import 'package:flutter/material.dart';

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({super.key});

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final _taskProvider = TaskProvider();
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () => show(context),
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
    );
  }

  void show(BuildContext context) {
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
                    onSelected: (String value) => setState(() {
                      listId = value;
                    }),
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
                  setState(() {
                    _taskProvider.addTask(
                      title: titleController.text,
                      description: descController.text,
                      date: DateTime.now(),
                      listId: listId,
                    );
                  });
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }
}