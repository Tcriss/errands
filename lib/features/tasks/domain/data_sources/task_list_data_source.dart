import '../entities/task_list.dart';

abstract interface class TaskListDataSource {
  Future<List<TaskListEntity>> findAllLists(String userId);
  Future<TaskListEntity> findOneList(String id);
  Future<TaskListEntity> createList(TaskListEntity list);
  Future<TaskListEntity> updateList(TaskListEntity list, String id);
  Future<String> deleteList(String id);
}
