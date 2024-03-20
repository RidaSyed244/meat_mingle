import 'package:flutter/material.dart';

class CustomTextFields extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;
  final IconButton? prefixIcon;
  final TextButton? suffixIcon;
  final Color? color;
  final TextEditingController? controller;
  final Color? textcolor;
  final double? fontSize;
  final double? width;
  final double? height;
  final TextInputType? keyBoardType;

  const CustomTextFields({
    this.prefixIcon,
    this.suffixIcon,
    this.text,
    this.keyBoardType,
    this.height,
    this.controller,
    this.width,
    this.textcolor,
    this.onPressed,
    this.color,
    this.fontSize,
  });

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.black,
        fontSize: widget.fontSize,
      ),
      keyboardType: widget.keyBoardType,
      controller: widget.controller,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        hintText: widget.text,
        hintStyle: TextStyle(
          color: widget.textcolor,
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}
