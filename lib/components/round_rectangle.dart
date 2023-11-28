import 'package:flutter/material.dart';

class RoundRectangle extends StatelessWidget {
  final String message;
  final Color? textColor;
  final Color? circleColor;
  final TextAlign? textAlign;

  Function(String) onPressed;

  RoundRectangle(this.message, this.onPressed,
      {super.key, this.textColor, this.circleColor, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(80, 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
            backgroundColor: circleColor ?? const Color(0xFF505050),
          ),
          onPressed: () => onPressed(message),
          child: Text(
            textAlign: textAlign,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 35,
            ),
            message,
          )),
    );
  }
}
