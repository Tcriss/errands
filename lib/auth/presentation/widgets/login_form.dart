import 'package:errands/auth/presentation/providers/auth-provider.dart';
import 'package:errands/core/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _authProvider = AuthProvider();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final pwFocus = FocusNode();

  String? _validate(String? value) =>
      value == null || value.isEmpty ? 'This fields is required' : null;

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar(String label) => SnackBar(content: Text(label));

    Future<void> login(String email, String password) async {
      await _authProvider.login(email, password, context);
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
              isLoading: _authProvider.isloading,
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  login(_emailController.text, _passwordController.text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
