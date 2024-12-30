import 'package:errands/features/auth/domain/repositories/auth_repository.dart';
import 'package:errands/core/common/widgets/widgets.dart';
import 'package:errands/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SingupForm extends StatefulWidget {
  const SingupForm({super.key});

  @override
  State<SingupForm> createState() => _SingupFormState();
}

class _SingupFormState extends State<SingupForm> {
  final _formKey = GlobalKey<FormState>();
  final _authRepository = locator<AuthRepository>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final nameFocus = TextEditingController();
  final emailFocus = FocusNode();
  final pwFocus = FocusNode();
  bool _isLoading = false;

  String? _validate(String? value) =>
      value == null || value.isEmpty ? 'This fields is required' : null;

  String? _confirmPw(String? value) =>
      value != _passwordController.value.text || value == null || value.isEmpty
          ? 'Password mismatch, check your password is correct'
          : null;

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar(String label) => SnackBar(content: Text(label));

    Future<void> singUp() async {
      setState(() => _isLoading = true);

      try {
        final res = await _authRepository.signUpWithEmailPassword(
          name: _nameController.value.text,
          email: _emailController.value.text,
          password: _passwordController.value.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar('User: $res'));
      } on AuthException catch (e) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(snackBar(e.message));
      } catch (e) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(snackBar('An unexpected error has ocurred'));
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        spacing: 15,
        children: [
          CustomInput(
            label: 'Name',
            controller: _nameController,
            validator: _validate,
            placeHolder: 'Tap to write',
            preffixIcon: const Icon(
              Icons.person_2_outlined,
              color: Colors.black38,
            ),
          ),
          CustomInput(
            label: 'Email',
            controller: _emailController,
            placeHolder: 'Tap to write',
            validator: _validate,
            preffixIcon: const Icon(
              Icons.email_outlined,
              color: Colors.black38,
            ),
          ),
          CustomInput(
            label: 'Password',
            controller: _passwordController,
            validator: _validate,
            placeHolder: 'Tap to write',
            preffixIcon: const Icon(Icons.key_outlined, color: Colors.black38),
            obscureText: true,
          ),
          CustomInput(
            label: 'Confirm password',
            controller: _confirmPasswordController,
            placeHolder: 'Tap to write',
            validator: _confirmPw,
            preffixIcon: const Icon(Icons.key_outlined, color: Colors.black38),
            obscureText: true,
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: CustomFilledButton(
              label: 'Create account',
              isLoading: _isLoading,
              onPress: () {
                if (_formKey.currentState!.validate()) singUp();
              },
            ),
          ),
        ],
      ),
    );
  }
}
