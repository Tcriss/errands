import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  final FontWeight? fontWeight;

  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPress,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      padding: EdgeInsets.all(0),
      
    );

    return TextButton(
      onPressed: onPress,
      style: buttonStyle,
      child: Text(label, style: TextStyle(fontWeight: fontWeight)),
    );
  }
}
