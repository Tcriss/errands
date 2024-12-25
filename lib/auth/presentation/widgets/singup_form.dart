import 'package:errands/core/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SingupForm extends StatefulWidget {
  const SingupForm({super.key});

  @override
  State<SingupForm> createState() => _SingupFormState();
}

class _SingupFormState extends State<SingupForm> {
  @override
  Widget build(BuildContext context) {
    void login(String text) => print(text);

    return Form(
      child: Column(
        spacing: 15,
        children: [
          CustomInput(
            onValue: login,
            label: 'Email',
            placeHolder: 'Tap to write',
            preffixIcon: const Icon(
              Icons.email_outlined,
              color: Colors.black38,
            ),
          ),
          CustomInput(
            onValue: login,
            label: 'Password',
            placeHolder: 'Tap to write',
            preffixIcon: const Icon(Icons.key_outlined, color: Colors.black38),
          ),
          CustomInput(
            onValue: login,
            label: 'Confirm password',
            placeHolder: 'Tap to write',
            preffixIcon: const Icon(Icons.key_outlined, color: Colors.black38),
          ),
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: CustomTextButton(label: 'Forgot Password', fontWeight: FontWeight.bold, onPress: () {}),
          ),
          //const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: CustomFilledButton(label: 'Login', onPress: () {}),
          ),
        ],
      ),
    );
  }
}
