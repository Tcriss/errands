import 'dart:ui';

import 'package:errands/tasks/domain/entities/task_list.dart';
import 'package:errands/tasks/presentation/widgets/task-card.dart';
import 'package:flutter/material.dart';

class TaksListTile extends StatelessWidget {
  final TaskListEntity _list;

  const TaksListTile({
    super.key,
    required TaskListEntity list,
  }) : _list = list;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [BoxShadow(color: Colors.grey.shade300)]),
      child: ExpansionTile(
        title: Text(_list.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_list.tasks.length.toString()),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        showTrailingIcon: true,
        children: _list.tasks.map((task) => TaskCard(task: task)).toList(),
        // children: [
        //   ListView.builder(
        //     itemCount: _list.tasks.length,
        //     itemBuilder: (context, index) => ,
        //   )
        // ],
      ),
    );
  }
}
