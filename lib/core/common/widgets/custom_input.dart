import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? _placeHolder;
  final Widget? _suffixIcon;
  final Widget? _preffixIcon;
  final Function(PointerDownEvent)? _onTapOutside;
  final String _label;
  final TextEditingController? _controller;
  final FocusNode? _focus;
  final FormFieldValidator<String>? validator;
  final bool _obscureText;

  const CustomInput({
    super.key,
    String? placeHolder = 'Tap to write',
    Widget? suffixIcon,
    Widget? preffixIcon,
    required String label,
    Function(PointerDownEvent)? onTapOutside,
    FocusNode? focus,
    TextEditingController? controller,
    this.validator,
    bool obscureText = false,
  }) : _obscureText = obscureText,
       _label = label,
       _preffixIcon = preffixIcon,
       _suffixIcon = suffixIcon,
       _placeHolder = placeHolder,
       _controller = controller,
       _onTapOutside = onTapOutside,
       _focus = focus;

  @override
  Widget build(BuildContext context) {
    final InputDecoration inputDecoration = InputDecoration(
      filled: true,
      hintText: _placeHolder,
      prefixIcon: _preffixIcon,
      suffixIcon: _suffixIcon,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
      ),
      alignLabelWithHint: true,
      labelText: _label,
      errorText: null,
    );

    return TextFormField(
      onTapOutside: _onTapOutside,
      focusNode: _focus,
      controller: _controller,
      dragStartBehavior: DragStartBehavior.down,
      decoration: inputDecoration,
      validator: validator,
      obscureText: _obscureText,
    );
  }
}
