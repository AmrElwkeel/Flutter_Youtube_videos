import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? obscure;
  const CustomTextField({this.controller, this.obscure, Key? key})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obsc = widget.obscure ?? false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obsc,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.blue, width: 1.6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.blue, width: 1.6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.blue, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.red, width: 1.6),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.white10, width: 1.6),
        ),
      ),
    );
  }
}
