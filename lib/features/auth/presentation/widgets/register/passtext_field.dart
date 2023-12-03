import 'package:flutter/material.dart';

class PassTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPasswordField;
  final String? hinText;
  final FormFieldValidator<String>? validator;
  final bool? obsurText;
  final bool? isError;

  const PassTextField({
    super.key,
    this.controller,
    this.isPasswordField,
    this.hinText,
    this.validator,
    this.isError,
    this.obsurText,
  });

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool _obsecureText = true;
  bool isFirstError = true;

  @override
  Widget build(BuildContext context) {
    if (widget.isError == true && isFirstError) {}
    return TextFormField(
      controller: widget.controller,
      obscureText: _obsecureText,
      cursorColor: Colors.white70,
      validator: widget.validator,
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
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              if (_obsecureText) {
                _obsecureText = false;
              } else {
                _obsecureText = true;
              }
            });
          },
          icon: Icon(
            _obsecureText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
