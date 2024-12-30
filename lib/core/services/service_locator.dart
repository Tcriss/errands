import 'package:errands/features/auth/data/data_sources/remote_data_source.dart';
import 'package:errands/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:errands/features/auth/domain/repositories/auth_repository.dart';
import 'package:errands/core/services/supabase_network.dart';
import 'package:errands/features/tasks/data/data_sources/remote_task_data_source.dart';
import 'package:errands/features/tasks/data/data_sources/remote_task_list_data_source.dart';
import 'package:errands/features/tasks/data/repositories/supabase_task_list_repository.dart';
import 'package:errands/features/tasks/data/repositories/supabase_task_repository.dart';
import 'package:errands/features/tasks/domain/data_sources/task_data_source.dart';
import 'package:errands/features/tasks/domain/data_sources/task_list_data_source.dart';
import 'package:errands/features/tasks/domain/repository/task_list_repository.dart';
import 'package:errands/features/tasks/domain/repository/task_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  locator.registerLazySingleton<SupabaseClient>(
    () => SupabaseNetwork(Supabase.instance).client,
  );
  locator.registerFactory<RemoteDataSource>(
    () => RemoteDataSource(locator<SupabaseClient>()),
  );
  locator.registerFactory<AuthRepository>(
    () => SupabaseAuthRepository(locator<RemoteDataSource>()),
  );
  locator.registerLazySingleton<TaskDataSource>(
    () => RemoteTaskDataSource(locator<SupabaseClient>()),
  );
  locator.registerLazySingleton<TaskListDataSource>(
    () => RemoteTaskListDataSource(locator<SupabaseClient>()),
  );
  locator.registerLazySingleton<TaskRepository>(
    () => SupabaseTaskRepository(locator<TaskDataSource>()),
  );
  locator.registerLazySingleton<TaskListRepository>(
    () => SupabaseTaskListRepository(
      locator<TaskListDataSource>(),
      locator<AuthRepository>()
    )
  );
}
