import 'package:errands/features/tasks/domain/entities/task.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final DateTime? date;
  final String listId;
  final bool completed;

  const TaskModel({
    required this.id,
    required this.title,
    this.description = '',
    this.date,
    required this.listId,
    this.completed = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    date: json['date'],
    listId: json['listId'],
    completed: json['completed'],
  );

  static List<TaskModel> fromPostgresRes(List<Map<String, dynamic>> data) {
    return data
        .map(
          (row) => TaskModel(
            id: row['id'] as String,
            title: row['title'] as String,
            description: row['description'] as String,
            date: row['date'] as DateTime,
            listId: row['listId'] as String,
            completed: row['completed'] as bool,
          ),
        )
        .toList();
  }

  factory TaskModel.fromEntity(TaskEntity task) => TaskModel(
    id: task.id,
    title: task.title,
    description: task.description,
    date: task.date,
    listId: task.listId,
    completed: task.completed,
  );

  TaskEntity toEntity() => TaskEntity(
    id: id,
    title: title,
    description: description,
    date: date,
    listId: listId,
    completed: completed,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    "title": title,
    'description': description,
    'date': date,
    'listId': listId,
    'completed': completed,
  };
}
