import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {this.controller,
      this.inputFormatters,
      this.keyboardType,
      this.validator,
      this.hintText,
      this.onChanged,
      this.obscureText = false,
      super.key});

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final GlobalKey<FormFieldState> _globalKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _globalKey,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        if (_globalKey.currentState?.validate() == true) {
          widget.onChanged?.call(value);
        }
      },
      inputFormatters: widget.inputFormatters,
      // MaskedInputFormatter('(###) ###-####')],
      controller: widget.controller,
      validator: widget.validator,
      style: const TextStyle(fontSize: 20),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color.fromARGB(255, 246, 248, 250),
      ),
    );
  }
}
