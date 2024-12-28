import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  final bool _isLoading;

  const CustomFilledButton({
    super.key,
    required this.label,
    required this.onPress,
    bool isLoading = false,
  }) : _isLoading = isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: _isLoading ? null : onPress,
      style: FilledButton.styleFrom(
        fixedSize: Size.fromHeight(55.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      child: _isLoading ? const CircularProgressIndicator() : Text(label),
    );
  }
}
