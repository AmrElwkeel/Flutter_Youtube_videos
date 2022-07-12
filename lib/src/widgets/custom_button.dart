import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  const CustomButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: MaterialButton(
        color: Colors.blue,
        onPressed: widget.onPressed,
        child: Text(widget.text),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.2),
            borderSide: BorderSide.none),
      ),
    );
  }
}
