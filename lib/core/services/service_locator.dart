import 'package:errands/auth/data/data_sources/remote_data_source.dart';
import 'package:errands/auth/data/repositories/supabase_auth_repository.dart';
import 'package:errands/auth/domain/repositories/auth_repository.dart';
import 'package:errands/core/services/supabase_network.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerFactory<SupabaseClient>(
    () => SupabaseNetwork(Supabase.instance).client,
  );
  sl.registerFactory<RemoteDataSource>(
    () => RemoteDataSource(sl<SupabaseClient>()),
  );
  sl.registerFactory<AuthRepository>(
    () => SupabaseAuthRepository(sl<RemoteDataSource>()),
  );
}
