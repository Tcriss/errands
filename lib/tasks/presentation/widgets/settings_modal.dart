import 'package:errands/auth/presentation/providers/auth-provider.dart';
import 'package:errands/core/common/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

class SettingsModal extends StatelessWidget {
  final _authProvider = AuthProvider();
  
  SettingsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _show(context),
      child: CircleAvatar(
        //TODO: implement user's profile picture
        backgroundImage: AssetImage('assets/images/manager.png'),
        radius: 40.0,
      ),
    );
  }

  void _show(BuildContext context) {

    Future<void> logout() async {
      _authProvider.logout(context);
      Navigator.pop(context);
    }

    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16.0,
            children: [
              //TODO: implement more settings
              CustomFilledButton(
                isLoading: _authProvider.isloading,
                label: 'Logout',
                onPress: logout
              )
            ],
          ),
        );
      },
    );
  }
}
