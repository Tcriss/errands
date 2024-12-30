import '../entities/task_list.dart';

abstract interface class TaskListRepository {
  Future<TaskListEntity> findAllLists();
  Future<TaskListEntity> findOneList();
  Future<TaskListEntity> createList();
  Future<TaskListEntity> updateList();
  Future<TaskListEntity> deleteList();
}