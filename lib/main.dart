import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  String resetButton = "AC";
  String output = "";
  int firstOperand = 0;
  int secondOperand = 0;
  String operation = "";
  bool isNewInput = true;
  bool isNewOperation = true;
  bool isDecimal = false;

  void clear() {
    output = "";
    firstOperand = 0;
    secondOperand = 0;
    operation = "";
    isNewInput = true;
    isNewOperation = true;
  }

  void partialClear() {
    resetButton = "AC";
    output = "";
    isNewInput = true;
  }

  void updateOutput(int value) {
      output = value.toString();
  }

  void calculate() {

    if (isNewOperation) {
      isNewOperation = false;
      secondOperand = int.parse(output);
    }

    if (operation.isNotEmpty) {
      int value = 0;
      // secondOperand = double.parse(output);
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
          value = firstOperand ~/ secondOperand;
          break;
      }
      updateOutput(value);
      operation = "";
      //isNewOperation = true;
      isNewInput = true;
    }
  }

  void setOperation(String operation) {
    if (isNewOperation) {
      firstOperand = int.parse(output);
      this.operation = operation;
      isNewOperation = false;
    } else {
      secondOperand = int.parse(output);
      calculate();
      firstOperand = int.parse(output);
      this.operation = operation;
    }
    isNewInput = true;
  }

  void input(int value) {
    resetButton = "C";

    if (output.length > 7) return;

    if (isNewInput) {
      updateOutput(value);
      isNewInput = false;
    } else {
      value = int.parse(output) * 10 + value;
      updateOutput(value);
    }
  }

  void onPressed(String action) {
    setState(() {
      if (action == 'AC') {
        clear();
      } else if (action == 'C') {
        partialClear();
      } else if (action == '=') {
        secondOperand = int.parse(output);
        calculate();
      }else if (action == '+/-') {
        updateOutput(int.parse(output) * -1);
      } else if (action == '%') {
        updateOutput(int.parse(output) ~/ 100);
      }
      else if (action == '.') {
        // Decimal numbers not implemented.
        // Negative numbers not implemented.
      } else if ("+-×÷%".contains(action)) {
        setOperation(action);
      } else {
        input(int.parse(action));
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
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontFamily: "Helvetica",
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
                      resetButton,
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
