import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

import 'package:errands/auth/domain/entities/user.dart';
import 'package:errands/auth/domain/repositories/auth_repository.dart';
import 'package:errands/core/services/service_locator.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository = locator<AuthRepository>();
  bool _isLoading = false;
  UserEntity? _user;

  UserEntity? get currentUser => _user;
  bool get isloading => _isLoading;

  Future<void> fetchUser(BuildContext context) async {
    try {
      _user = await _authRepository.currentUser()!;
      notifyListeners();
    } on AuthException catch (err) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(err.message)));
        Navigator.of(context).pushNamed('/login');
      }
    } catch (err) {
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$err')));
    }
  }

  Future<void> login(String email, String password, BuildContext context) async {
    _isLoading = true;

    try {
      final res = await _authRepository.loginWithEmailPassword(email: email, password: password);

      if (context.mounted) {
        _user = res;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(' Welcome: ${res.name}'),
        ));
        Navigator.of(context).pushReplacementNamed('/tasks');
      }
    } on AuthException catch (e) {
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      _isLoading = false;
    }

    notifyListeners();
  }
}
