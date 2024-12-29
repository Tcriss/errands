import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseNetwork {
  final Supabase _supabase;

  SupabaseNetwork(this._supabase);

  SupabaseClient get client => _supabase.client;
}
