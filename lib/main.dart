import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:testing/components/round_circle.dart';
import 'package:testing/components/round_rectangle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 90,
                    ),
                    value.toString(),
                  )
                ],
              )),
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundCircle("AC", textColor: Colors.black, circleColor: Color(
                    0xffd3d3d1)),
                RoundCircle("+/-", textColor: Colors.black, circleColor: Color(
                    0xffd3d3d1)),
                RoundCircle("%", textColor: Colors.black, circleColor: Color(
                    0xffd3d3d1)),
                RoundCircle("÷", textColor: Colors.white, circleColor: Color(
                    0xfffd9401)),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundCircle("7"),
                RoundCircle("8"),
                RoundCircle("9"),
                RoundCircle("×", textColor: Colors.white, circleColor: Color(
                    0xfffd9401)),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundCircle("4"),
                RoundCircle("5"),
                RoundCircle("6"),
                RoundCircle("-", textColor: Colors.white, circleColor: Color(
                    0xfffd9401)),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundCircle("1"),
                RoundCircle("2"),
                RoundCircle("3"),
                RoundCircle("+", textColor: Colors.white, circleColor: Color(
                    0xfffd9401)),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundRectangle("0"),
                RoundCircle("."),
                RoundCircle("=", textColor: Colors.white, circleColor: Color(
                    0xfffd9401)),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
