import 'task.dart';

interface class TaskListEntity {
  final String id;
  final String name;
  final String userId;
  final List<TaskEntity> tasks;

  const TaskListEntity({
    required this.id,
    required this.name,
    required this.userId,
    this.tasks = const []
  });
}
