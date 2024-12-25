import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRepository {
  Future<User> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<User> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Session> currentSession();

  Future<User> currentUser();
}
