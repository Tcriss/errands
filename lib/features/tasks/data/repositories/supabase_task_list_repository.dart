import 'package:errands/features/auth/domain/entities/user.dart';
import 'package:errands/features/auth/domain/repositories/auth_repository.dart';
import 'package:errands/features/tasks/domain/data_sources/task_list_data_source.dart';
import 'package:errands/features/tasks/domain/entities/task_list.dart';
import 'package:errands/features/tasks/domain/repository/task_list_repository.dart';

class SupabaseTaskListRepository implements TaskListRepository {
  final TaskListDataSource _dataSource;
  final AuthRepository _authRepository;

  const SupabaseTaskListRepository(this._dataSource, this._authRepository);

  @override
  Future<List<TaskListEntity>> findAllLists() async {
    try {
      final UserEntity? user = await _authRepository.currentUser();

      return _dataSource.findAllLists(user!.id);
    } catch (err) {
      throw Exception('$err');
    }
  }

  @override
  Future<TaskListEntity> findOneList(String id) async {
    try {
      return _dataSource.findOneList(id);
    } catch (err) {
      throw Exception('$err');
    }
  }

  @override
  Future<TaskListEntity> createList(TaskListEntity list) async {
    try {
      return _dataSource.createList(list);
    } catch (err) {
      throw Exception('$err');
    }
  }

  @override
  Future<TaskListEntity> updateList(TaskListEntity list) async {
    try {
      return _dataSource.updateList(list, list.id);
    } catch (err) {
      throw Exception('$err');
    }
  }

  @override
  Future<String> deleteList(String id) async {
    try {
      return _dataSource.deleteList(id);
    } catch (err) {
      throw Exception('$err');
    }
  }
}
