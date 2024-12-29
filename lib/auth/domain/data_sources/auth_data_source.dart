import 'package:errands/auth/domain/entities/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDataSource {
  Future<UserEntity> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserEntity> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();

  Future<Session?> currentSession();

  Future<UserEntity?> currentUser();
}
