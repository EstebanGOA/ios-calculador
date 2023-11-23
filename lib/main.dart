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
  String output = "";
  double firstOperand = 0.0;
  double secondOperand = 0.0;
  String operation = "";
  bool isNewInput = true;
  bool isDecimal = false;

  void clear() {
    output = "";
    firstOperand = 0.0;
    secondOperand = 0.0;
    operation = "";
    isNewInput = true;
  }

  void updateOutput(double value) {
    if (value != value.toInt()) {
      output = value.toString();
      isDecimal = true;
    } else {
      output = value.toInt().toString();
      isDecimal = false;
    }
  }

  void calculate() {
    if (operation.isNotEmpty) {
      double value = 0.0;
      secondOperand = double.parse(output);
      switch(operation) {
        case '+':
          value = firstOperand + secondOperand;
          break;
        case '-':
          value = firstOperand - secondOperand;
          break;
        case '×':
          value = firstOperand * secondOperand;
          break;
        case '÷':
          value = firstOperand / secondOperand;
          break;
      }
      updateOutput(value);
      operation = "";
      isNewInput = true;
      isDecimal = false;
    }
  }

  void setOperation(String operation) {
    if (this.operation.isNotEmpty) {
      calculate();
    }
    firstOperand = double.parse(output);
    this.operation = operation;
    isNewInput = true;
    isDecimal = false;
  }

  void input(double value) {
    if (isNewInput) {
      updateOutput(value);
      isNewInput = false;
    } else {
      if (isDecimal) {
        value = double.parse(output + value.toInt().toString());
      } else {
        value = double.parse(output) * 10 + value;
      }
      updateOutput(value);
    }
  }

  void onPressed(String action) {
    setState(() {
      if (action == 'AC') {
        clear();
      } else if (action == '=') {
        calculate();
      } else if (action == '.') {
        if (isDecimal == true) return;
        isDecimal = true;
        output = '$output.';
        // Negative numbers not implemented.
      } else if ("+-×÷%".contains(action)) {
        setOperation(action);
      } else {
        input(double.parse(action));
      }
    });
  }

  void onDragEvent(DragEndDetails event) {
    if (output.isNotEmpty) {
      setState(() {
        output = output.substring(0, output.length - 1);
        if (!output.contains(".")) {
          isDecimal = false;
        }
        if (output == "") {
          output = "0";
        }
      });
    }
  }

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
                  child: GestureDetector(
                      onHorizontalDragEnd: onDragEvent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 90,
                            ),
                            output,
                          )
                        ],
                      ))),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundCircle(
                      "AC",
                      onPressed,
                      textColor: Colors.black,
                      circleColor: const Color(0xffd3d3d1),
                    ),
                    RoundCircle(
                      "+/-",
                      onPressed,
                      textColor: Colors.black,
                      circleColor: const Color(0xffd3d3d1),
                    ),
                    RoundCircle(
                      "%",
                      onPressed,
                      textColor: Colors.black,
                      circleColor: const Color(0xffd3d3d1),
                    ),
                    RoundCircle(
                      "÷",
                      onPressed,
                      textColor: Colors.white,
                      circleColor: const Color(0xfffd9401),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundCircle("7", onPressed),
                    RoundCircle("8", onPressed),
                    RoundCircle("9", onPressed),
                    RoundCircle("×", onPressed,
                        textColor: Colors.white,
                        circleColor: Color(0xfffd9401)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundCircle("4", onPressed),
                    RoundCircle("5", onPressed),
                    RoundCircle("6", onPressed),
                    RoundCircle("-", onPressed,
                        textColor: Colors.white,
                        circleColor: Color(0xfffd9401)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundCircle("1", onPressed),
                    RoundCircle("2", onPressed),
                    RoundCircle("3", onPressed),
                    RoundCircle("+", onPressed,
                        textColor: Colors.white,
                        circleColor: Color(0xfffd9401)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundRectangle("0", onPressed),
                    RoundCircle(".", onPressed),
                    RoundCircle("=", onPressed,
                        textColor: Colors.white,
                        circleColor: Color(0xfffd9401)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
