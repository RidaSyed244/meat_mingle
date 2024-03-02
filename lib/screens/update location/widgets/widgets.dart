import 'package:flutter/material.dart';

class CircularCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const CircularCheckBox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: hight * 0.09,
        height: width * 0.09,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          color: value ? Colors.black : Colors.white,
        ),
        child: Center(
          child: value
              ? Icon(
                  Icons.check,
                  size: 16.0,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
