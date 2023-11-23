import 'package:flutter/material.dart';

class RoundCircle extends StatelessWidget {

  final String message;
  final Color? textColor;
  final Color? circleColor;

  Function(String) onPressed;

  RoundCircle(this.message, this.onPressed, {super.key, this.textColor, this.circleColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            minimumSize: const Size(90, 90),
            // maximumSize: Size.infinite,
            // padding: const EdgeInsets.all(20),
            backgroundColor: circleColor ?? const Color(0xFF505050),
        ),
        onPressed: () => onPressed(message),
        child: Text(
            style: TextStyle(
            color: textColor ?? Colors.white,
              fontSize: 22,
          ),
          message,
        )
    );
  }

}