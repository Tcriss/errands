import 'package:errands/auth/data/data_sources/remote_data_source.dart';
import 'package:errands/auth/domain/entities/user.dart';
import 'package:errands/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository implements AuthRepository {
  final RemoteDataSource _source;

  SupabaseAuthRepository(this._source);

  @override
  Future<UserEntity> loginWithEmailPassword({
    required String email,
    required String password,
  }) async =>
      _source.loginWithEmailPassword(email: email, password: password)
          as UserEntity;

  @override
  Future<UserEntity> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async =>
      _source.signUpWithEmailPassword(
            name: name,
            email: email,
            password: password,
          )
          as UserEntity;

  @override
  Future<Session?> currentSession() async => _source.currentSession();

  @override
  Future<UserEntity?> currentUser() async =>
      _source.currentUser() as UserEntity;

  @override
  Future<void> logOut() async => _source.logOut();
}
