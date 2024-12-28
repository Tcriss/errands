import 'package:errands/auth/presentation/widgets/login_form.dart';
import 'package:errands/core/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double deviceWidth = constraints.maxWidth;
            
                return SizedBox(
                  width: deviceWidth > 600 ? deviceWidth * 0.5 : deviceWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10.0,
                    children: [
                      const SizedBox(
                        height: 200,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const LoginForm(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5.0,
                        children: [
                          const Text("Don't have an account?"),
                          CustomTextButton(
                            label: 'Create an account',
                            fontWeight: FontWeight.bold,
                            onPress: () => Navigator.pushNamed(context, '/sing-up'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
