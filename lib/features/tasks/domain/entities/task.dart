interface class TaskEntity {
  final String id;
  final String title;
  final String description;
  final DateTime? date;
  final String listId;
  final bool completed;

  const TaskEntity({
    required this.id,
    required this.title,
    this.description = '',
    this.date,
    required this.listId,
    this.completed = false
  });
}
