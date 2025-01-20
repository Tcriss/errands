import '../entities/task_list.dart';

abstract interface class TaskListRepository {
  Future<List<TaskListEntity>> findAllLists();
  Future<TaskListEntity> findOneList(String id);
  Future<TaskListEntity> createList(TaskListEntity list);
  Future<TaskListEntity> updateList(TaskListEntity list);
  Future<String> deleteList(String id);
}