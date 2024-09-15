// import 'package:calculator_app/squares.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppScreenState();
}

class _CalculatorAppScreenState extends State<CalculatorApp> {
  String inptxt = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.blue, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 0, // How much the shadow spreads
              blurRadius: 6, // How soft the shadow looks
              offset: Offset(0, 4), // Shadow position (x, y)
            ),
          ]),
          child: Text('Calculator',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          height: 50,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Spacer(),
                Text(
                  inptxt,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Spacer(),
                Text(
                  result,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),
          alignment: Alignment.centerRight,
          height: 140,
          color: const Color.fromARGB(255, 107, 107, 107),
        ),
        Column(
          children: [
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('C');
                  },
                  child: calcbtn('C', 'op'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: calcbtn('+\\-', 'op'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('%');
                  },
                  child: calcbtn('%', 'op'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('DEL');
                  },
                  child: calcbtn('DEL', 'op'),
                ),
              )
            ]),
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('7');
                  },
                  child: calcbtn('7', 'nu'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('8');
                  },
                  child: calcbtn('8', 'nu'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('9');
                  },
                  child: calcbtn('9', 'nu'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('/');
                  },
                  child: calcbtn('/', 'op2'),
                ),
              )
            ]),
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('6');
                  },
                  child: calcbtn('6', 'nu'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('5');
                  },
                  child: calcbtn('5', 'nu'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('4');
                  },
                  child: calcbtn('4', 'nu'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('*');
                  },
                  child: calcbtn('x', 'op2'),
                ),
              )
            ]),
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('3');
                  },
                  child: Expanded(child: calcbtn('3', 'nu')),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('2');
                  },
                  child: Expanded(child: calcbtn('2', 'nu')),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('1');
                  },
                  child: calcbtn('1', 'nu'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('-');
                  },
                  child: calcbtn('-', 'op2'),
                ),
              )
            ]),
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('0');
                  },
                  child: Expanded(child: calcbtn('0', 'nu')),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('.');
                  },
                  child: Expanded(child: calcbtn('.', 'nu')),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      checkislastnumberisnumber(inptxt);
                      Parser p = Parser();
                      Expression exp = p.parse(inptxt);
                      double res =
                          exp.evaluate(EvaluationType.REAL, ContextModel());
                      result = res.toString();
                      inptxt = result;
                    });
                  },
                  child: calcbtn('=', 'eq'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    tapbtns('+');
                  },
                  child: calcbtn('+', 'op2'),
                ),
              )
            ]),
          ],
        ),
      ],
    )));
  }

  void tapbtns(String s) {
    setState(() {
      if (s == 'C') {
        inptxt = '';
        result = '';
      } else if (s == 'DEL') {
        if (inptxt.isNotEmpty) {
          inptxt = inptxt.substring(0, inptxt.length - 1);
        }
      } else if (RegExp(r'[0-9]').hasMatch(s)) {
        inptxt += s;
      } else if (s == '-' || s == '*' || s == '+' || s == '/' || s == '%') {
        if(inptxt.isNotEmpty)
        // Check if the last character is an operator before appending a new one
        if (checklast(inptxt)) {
          inptxt += s;
        }
      } else if (s == '.') {
        // Ensure only one dot is allowed in the current number
        String checkdot = getlastnumber(inptxt);
        if (!checkdot.contains('.') && checkdot.isNotEmpty) {
          inptxt += '.';
        }
      }
    });
  }

  void checkislastnumberisnumber(String inp) {
    if (inp.isEmpty || !RegExp(r'[0-9]').hasMatch(inp[inp.length - 1])) {
      inptxt += '0';
    }
  }

  String getlastnumber(String input) {
    RegExp regExp = RegExp(r'(\d+(\.\d*)?)$');
    Match? match = regExp.firstMatch(input);
    if (match != null) {
      return match.group(0) ?? '';
    }
    return '';
  }
}

Container calcbtn(String data, String type) {
  Color col = Colors.white;
  if (type == 'op')
    col = const Color.fromARGB(255, 203, 221, 236);
  else if (type == 'op2')
    col = Colors.blue;
  else if (type == 'eq') col = Colors.orange;

  return Container(
    decoration: BoxDecoration(
        color: col,
        border: Border(
            right: BorderSide(
                color: const Color.fromARGB(255, 82, 82, 82), width: 0.5),
            bottom: BorderSide(
                color: const Color.fromARGB(255, 82, 82, 82), width: 0.5))),
    height: 70,
    alignment: Alignment.center,
    child: Text(
      data,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: type == 'op2' || type == 'eq' ? Colors.white : Colors.black),
    ),
  );
}

bool checklast(String inp) {
  if (inp.endsWith('%') ||
      inp.endsWith('+') ||
      inp.endsWith('-') ||
      inp.endsWith('x') ||
      inp.endsWith('/') ||
      inp.endsWith('.'))
    return false;
  else
    return true;
}
