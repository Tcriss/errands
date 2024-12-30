import '../entities/task.dart';

abstract interface class TaskDataSource {
  Future<TaskEntity> findAllTasks();
  Future<TaskEntity> findOneTask();
  Future<TaskEntity> createTask();
  Future<TaskEntity> updateTask();
  Future<TaskEntity> deleteTask();
}
