import 'package:errands/features/auth/presentation/widgets/singup_form.dart';
import 'package:errands/core/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SingupView extends StatelessWidget {
  const SingupView({super.key});

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
                    spacing: 10,
                    children: [
                      const SizedBox(
                        height: 200,
                        child: Center(
                          child: Text(
                            'Sing up',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SingupForm(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5.0,
                        children: [
                          const Text("Already have an account?"),
                          CustomTextButton(
                            label: 'Sing in',
                            fontWeight: FontWeight.bold,
                            onPress: () => Navigator.pushNamed(context, '/'),
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
