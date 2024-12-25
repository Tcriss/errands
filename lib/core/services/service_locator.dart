import 'package:errands/core/services/supabase_network.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerFactory<SupabaseClient>(() => SupabaseNetwork(Supabase.instance).client);
}
