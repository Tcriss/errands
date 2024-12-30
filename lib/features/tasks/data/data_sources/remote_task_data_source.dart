import 'package:errands/features/tasks/data/models/task_model.dart';
import 'package:errands/features/tasks/domain/data_sources/task_data_source.dart';
import 'package:errands/features/tasks/domain/entities/task.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteTaskDataSource implements TaskDataSource {
  final SupabaseClient _client;

  const RemoteTaskDataSource(this._client);

  @override
  Future<List<TaskEntity>> findAllTasks() async {
    try {
      final res = await _client.from('tasks').select('*');
      final tasks = TaskModel.fromPostgresRes(res);

      return tasks as List<TaskEntity>;
    } on PostgrestException catch (err) {
      throw Exception(err.message);
    } catch (err) {
      throw Exception('$err');
    }
  }

  @override
  Future<TaskEntity> findOneTask(String id) async {
    try {
      final res = await _client.from('tasks').select().eq('id', id).single();
      final tasks = TaskModel.fromJson(res);

      return tasks as TaskEntity;
    } on PostgrestException catch (err) {
      throw Exception(err.message);
    } catch (err) {
      throw Exception('$err');
    }
  }

  @override
  Future<TaskEntity> createTask(TaskEntity newTask) async {
    try {
      final res = await _client.from('tasks').insert(newTask).select().single();
      final task = TaskModel.fromJson(res);

      return task as TaskEntity;
    } on PostgrestException catch (err) {
      throw Exception(err.message);
    } catch (err) {
      throw Exception('$err');
    }
  }

  @override
  Future<TaskEntity> updateTask(TaskEntity changes, String id) async {
    try {
      final TaskModel values = TaskModel.fromEntity(changes);
      final res =
          await _client.from('tasks').update(values.toJson()).select().single();
      final task = TaskModel.fromJson(res);

      return task as TaskEntity;
    } on PostgrestException catch (err) {
      throw Exception(err.message);
    } catch (err) {
      throw Exception('$err');
    }
  }

  @override
  Future<String> deleteTask(String id) async {
    try {
      await _client.from('tasks').delete().eq('id', id);

      return 'Task deleted';
    } on PostgrestException catch (err) {
      throw Exception('$err.message');
    } catch (err) {
      throw Exception('$err');
    }
  }
}
