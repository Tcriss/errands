import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:errands/features/tasks/data/models/task_list_model.dart';
import 'package:errands/features/tasks/domain/data_sources/task_list_data_source.dart';
import 'package:errands/features/tasks/domain/entities/task_list.dart';

class RemoteTaskListDataSource implements TaskListDataSource {
  final SupabaseClient _client;

  const RemoteTaskListDataSource(this._client);

  @override
  Future<List<TaskListEntity>> findAllLists(String userId) async {
    try {
      final res = await _client
          .from('task_lists')
          .select('*')
          .eq('user_id', userId);
      final lists = TaskListModel.fromPostgresRes(res);

      return lists.map((list) => list.toEntity()).toList();
    } on PostgrestException catch (err) {
      throw Exception('$err.message');
    } catch (err) {
      throw Exception('An unexpected error has ocurred: $err');
    }
  }

  @override
  Future<TaskListEntity> findOneList(String id) async {
    try {
      final res =
          await _client.from('task_lists').select('*').eq('id', id).single();
      final list = TaskListModel.fromJson(res);

      return list.toEntity();
    } on PostgrestException catch (err) {
      throw Exception('$err.message');
    } catch (err) {
      throw Exception('An unexpected error has ocurred: $err');
    }
  }

  @override
  Future<TaskListEntity> createList(TaskListEntity newList) async {
    try {
      final res = await _client.from('task_lists').insert(newList).single();
      final list = TaskListModel.fromJson(res);

      return list.toEntity();
    } on PostgrestException catch (err) {
      throw Exception('$err.message');
    } catch (err) {
      throw Exception('An unexpected error has ocurred: $err');
    }
  }

  @override
  Future<TaskListEntity> updateList(TaskListEntity changes, String id) async {
    try {
      final values = TaskListModel.fromEntity(changes);
      final res = await _client.from('task_lists').update(values.toJson()).single();
      final list = TaskListModel.fromJson(res);

      return list.toEntity();
    } on PostgrestException catch (err) {
      throw Exception('$err.message');
    } catch (err) {
      throw Exception('An unexpected error has ocurred: $err');
    }
  }

  @override
  Future<String> deleteList(String id) async {
    try {
      await _client
          .from('task_list')
          .delete()
          .eq('id', id);

      return 'List deleted';
    } on PostgrestException catch (err) {
      throw Exception('$err.message');
    } catch (err) {
      throw Exception('An unexpected error has ocurred: $err');
    }
  }
}
