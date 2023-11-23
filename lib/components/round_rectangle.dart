import 'package:flutter/material.dart';

class RoundRectangle extends StatelessWidget {

  final String message;
  final Color? textColor;
  final Color? circleColor;

  Function(String) onPressed;

  RoundRectangle(this.message, this.onPressed, {super.key, this.textColor, this.circleColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0),
          ),
          padding: const EdgeInsets.fromLTRB(90, 30, 90, 30),
          backgroundColor: circleColor ?? const Color(0xFF505050),
        ),
        onPressed: () => onPressed(message),
        child: Text(
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 24,
          ),
          message,
        )
    );
  }

}