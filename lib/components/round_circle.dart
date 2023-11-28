import 'package:flutter/material.dart';

class RoundCircle extends StatelessWidget {
  final String message;
  final Color? textColor;
  final Color? circleColor;
  final TextAlign? textAlign;

  Function(String) onPressed;

  RoundCircle(this.message, this.onPressed,
      {super.key, this.textColor, this.circleColor, this.textAlign});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          minimumSize: const Size(80, 80),
          backgroundColor: circleColor ?? const Color(0xFF505050),
        ),
        onPressed: () => onPressed(message),
        child: Text(
          message,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 35,
          ),
        ));
  }
}
