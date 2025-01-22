import 'package:errands/auth/domain/entities/user.dart';
import 'package:errands/auth/presentation/providers/auth-provider.dart';
import 'package:errands/tasks/presentation/providers/task_provider.dart';
import 'package:errands/tasks/presentation/widgets/add_task_modal.dart';
import 'package:errands/tasks/presentation/widgets/task_list_tile.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatefulWidget {

  TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  final _taskProvider = TaskProvider();
  final _authProvider = AuthProvider();

  

  @override
  Widget build(BuildContext context) {
    final UserEntity? currentUser = _authProvider.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentUser != null ? 'Hello ${currentUser.name}' : 'Errands',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),  
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/manager.png'),
            radius: 20.0,
          ),
        )
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
