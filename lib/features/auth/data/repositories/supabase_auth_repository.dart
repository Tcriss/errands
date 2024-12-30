import 'package:errands/features/auth/domain/data_sources/auth_data_source.dart';
import 'package:errands/features/auth/domain/entities/user.dart';
import 'package:errands/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository implements AuthRepository {
  final AuthDataSource _dataSource;

  SupabaseAuthRepository(this._dataSource);

  @override
  Future<UserEntity> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      return _dataSource.loginWithEmailPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw AuthException('An unexpected error occurred. $e');
    }
  }

  @override
  Future<UserEntity> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      return _dataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw AuthException('An unexpected error occurred. $e');
    }
  }

  @override
  Future<Session?> currentSession() async {
    try {
      return _dataSource.currentSession();
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw AuthException('An unexpected error occurred. $e');
    }
  }

  @override
  Future<UserEntity?> currentUser() async {
    try {
      return _dataSource.currentUser();
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw AuthException('An unexpected error occurred. $e');
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _dataSource.logOut();
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw AuthException('An unexpected error occurred. $e');
    }
  }
}
