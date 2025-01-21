import 'package:errands/tasks/domain/entities/task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity _task;

  const TaskCard({
    super.key,
    required TaskEntity task
  }) : _task = task;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(_task.title),
      value: _task.completed,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {},
    );
    ;
  }
}
