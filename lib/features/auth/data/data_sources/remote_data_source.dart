import 'package:errands/features/auth/data/models/user_model.dart';
import 'package:errands/features/auth/domain/data_sources/auth_data_source.dart';
import 'package:errands/features/auth/domain/entities/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteDataSource implements AuthDataSource {
  final SupabaseClient _client;

  RemoteDataSource(this._client);

  @override
  Future<UserEntity> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final res = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final UserModel user = UserModel.fromSupabaseRes(res.user!);

    return user.toEntity();
  }

  @override
  Future<UserEntity> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    final res = await _client.auth.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );
    final UserModel user = UserModel.fromSupabaseRes(res.user!);

    return user.toEntity();
  }

  @override
  Future<UserEntity?> currentUser() async {
    final currentUser = UserModel.fromSupabaseRes(_client.auth.currentUser!);
    
    return currentUser.toEntity();
  }

  @override
  Future<Session?> currentSession() async => _client.auth.currentSession;

  @override
  Future<void> logOut() async => _client.auth.signOut();
}
