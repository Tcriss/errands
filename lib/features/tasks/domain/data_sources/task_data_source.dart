import '../entities/task.dart';

abstract interface class TaskDataSource {
  Future<List<TaskEntity>> findAllTasks();
  Future<TaskEntity> findOneTask(String id);
  Future<TaskEntity> createTask(TaskEntity task);
  Future<TaskEntity> updateTask(TaskEntity task, String id);
  Future<String> deleteTask(String id);
}
