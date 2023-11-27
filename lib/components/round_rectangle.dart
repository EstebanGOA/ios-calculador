import 'package:flutter/material.dart';

class RoundRectangle extends StatelessWidget {

  final String message;
  final Color? textColor;
  final Color? circleColor;
  final TextAlign? textAlign;

  Function(String) onPressed;

  RoundRectangle(this.message, this.onPressed, {super.key, this.textColor, this.circleColor, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0),
          ),
          padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
          backgroundColor: circleColor ?? const Color(0xFF505050),
        ),
        onPressed: () => onPressed(message),
        child: Text(
          softWrap: true,
          textAlign: textAlign,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 35,
          ),
          message,
        )
    );
  }

}