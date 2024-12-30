import 'package:errands/features/auth/domain/repositories/auth_repository.dart';
import 'package:errands/core/common/widgets/widgets.dart';
import 'package:errands/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _authRepository = locator<AuthRepository>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final pwFocus = FocusNode();
  bool _isLoading = false;

  String? _validate(String? value) =>
      value == null || value.isEmpty ? 'This fields is required' : null;

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar(String label) => SnackBar(content: Text(label));

    Future<void> login() async {
      try {
        final res = await _authRepository.loginWithEmailPassword(
          email: _emailController.value.text,
          password: _passwordController.value.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar('User: $res'));
      } on AuthException catch (e) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(snackBar(e.message));
      } catch (e) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(snackBar('$e'));
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        spacing: 15,
        children: [
          CustomInput(
            controller: _emailController,
            focus: emailFocus,
            onTapOutside: (e) => emailFocus.requestFocus(),
            label: 'Email',
            placeHolder: 'Tap to write',
            preffixIcon: const Icon(
              Icons.email_outlined,
              color: Colors.black38,
            ),
            validator: (value) {
              return _validate(value);
            },
          ),
          CustomInput(
            controller: _passwordController,
            focus: pwFocus,
            onTapOutside: (e) => emailFocus.requestFocus(),
            label: 'Password',
            placeHolder: 'Tap to write',
            preffixIcon: const Icon(Icons.key_outlined, color: Colors.black38),
            obscureText: true,
            validator: (value) {
              return _validate(value);
            },
          ),
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: CustomTextButton(
              label: 'Forgot Password',
              fontWeight: FontWeight.bold,
              onPress: () {},
            ),
          ),
          //const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: CustomFilledButton(
              label: 'Login',
              isLoading: _isLoading,
              onPress: () {
                if (_formKey.currentState!.validate()) login();
              },
            ),
          ),
        ],
      ),
    );
  }
}
