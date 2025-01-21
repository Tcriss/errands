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
      title: Text(_task.title, style: const TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(
        _task.description,
        style: const TextStyle(
          color: Color.fromARGB(255, 156, 156, 156)
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      value: _task.completed,
      contentPadding: const EdgeInsets.all(0.0),
      checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {},
    );
    ;
  }
}
