import 'package:errands/features/tasks/domain/entities/task.dart';
import 'package:errands/features/tasks/domain/entities/task_list.dart';

class TaskListModel {
  final String id;
  final String name;
  final String userId;
  final List<TaskEntity> tasks;

  const TaskListModel({
    required this.id,
    required this.name,
    required this.userId,
    this.tasks = const []
  });

  factory TaskListModel.fromJson(Map<String, dynamic> json) => TaskListModel(
    id: json['id'],
    name: json['name'],
    tasks: json['tasks'],
    userId: json['userId'],
  );

  static List<TaskListModel> fromPostgresRes(List<Map<String, dynamic>> data) {
    return data
        .map(
          (row) => TaskListModel(
            id: row['id'] as String,
            name: row['name'] as String,
            userId: row['user_id'] as String,
            tasks: row['tasks'] as List<TaskEntity>,
          ),
        )
        .toList();
  }

  static TaskListModel fromEntity(TaskListEntity list) => TaskListModel(
    id: list.id,
    name: list.name,
    userId: list.userId
  );

  TaskListEntity toEntity() =>
      TaskListEntity(id: id, name: name, userId: userId, tasks: tasks);

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'user_id': userId
  };
}
