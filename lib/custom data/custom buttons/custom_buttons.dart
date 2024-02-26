import 'package:flutter/material.dart';

class CustomButtons extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textcolor;
  final double fontSize;
  final double width;
  final double height;
  const CustomButtons({
    required this.text,
    required this.height,
    required this.width,
    required this.textcolor,
    required this.onPressed,
    required this.color,
    required this.fontSize,
  });

  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: widget.width,
      height: widget.height,
      onPressed: widget.onPressed,
      color: widget.color,
      textColor: widget.textcolor,
      // padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        widget.text,
        style: TextStyle(fontSize: widget.fontSize),
      ),
    );
  }
}
