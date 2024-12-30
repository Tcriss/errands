import '../entities/task.dart';

abstract interface class TaskRepository {
  Future<List<TaskEntity>> findAllTasks();
  Future<TaskEntity> findOneTask(String id);
  Future<TaskEntity> createTask(TaskEntity task);
  Future<TaskEntity> updateTask(TaskEntity task);
  Future<String> deleteTask(String id);
}