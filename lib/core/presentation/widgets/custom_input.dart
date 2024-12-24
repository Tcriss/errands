import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final ValueChanged<String> onValue;
  final String? placeHolder;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final String label;

  const CustomInput({
    super.key,
    required this.onValue,
    this.placeHolder = 'Tap to write',
    this.suffixIcon,
    this.preffixIcon,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final focus = FocusNode();

    void onSubmit(String value) {
      onValue(value);
      textController.clear();
      focus.requestFocus();
    }

    final InputDecoration inputDecoration = InputDecoration(
      filled: true,
      hintText: placeHolder,
      prefixIcon: preffixIcon,
      suffixIcon: suffixIcon,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
      ),
      alignLabelWithHint: true,
      labelText: label
    );

    return TextFormField(
      onTapOutside: (e) => focus.unfocus(),
      focusNode: focus,
      controller: textController,
      onFieldSubmitted: (value) => onSubmit(value),
      dragStartBehavior: DragStartBehavior.down,
      decoration: inputDecoration,
    );
  }
}
