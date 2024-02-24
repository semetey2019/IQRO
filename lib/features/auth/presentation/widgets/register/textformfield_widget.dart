import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPasswordField;
  final String? hinText;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final Function(String)? onChanged;
  final bool? isError;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.isPasswordField,
    this.hinText,
    this.validator,
    this.inputType,
    this.onChanged,
    this.isError,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool isFirstError = true;
  final bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      cursorColor: Colors.black,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: widget.isPasswordField == true ? _obsecureText : false,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hinText,
        errorStyle: const TextStyle(fontSize: 0),
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.black.withOpacity(.4),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
