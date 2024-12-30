import '../entities/task.dart';

abstract interface class TaskRepository {
  Future<TaskEntity> findAllTasks();
  Future<TaskEntity> findOneTask();
  Future<TaskEntity> createTask();
  Future<TaskEntity> updateTask();
  Future<TaskEntity> deleteTask();
}