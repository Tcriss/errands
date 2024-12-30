import 'package:errands/features/tasks/domain/data_sources/task_data_source.dart';
import 'package:errands/features/tasks/domain/entities/task.dart';
import 'package:errands/features/tasks/domain/repository/task_repository.dart';

class SupabaseTaskRepository implements TaskRepository {
  final TaskDataSource _dataSource;

  const SupabaseTaskRepository(this._dataSource);

  @override
  Future<List<TaskEntity>> findAllTasks() {
    try {
      return _dataSource.findAllTasks();
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<TaskEntity> findOneTask(String id) {
    try {
      return _dataSource.findOneTask(id);
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<TaskEntity> createTask(TaskEntity task) {
    try {
      return _dataSource.createTask(task);
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<TaskEntity> updateTask(TaskEntity task) {
    try {
      return _dataSource.updateTask(task, task.id);
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  Future<String> deleteTask(String id) {
    try {
      return _dataSource.deleteTask(id);
    } catch (err) {
      throw Exception(err);
    }
  }
}
