// import 'package:calculator_app/squares.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body:Row(
          children: [
            Container(
              
              color: const Color.fromARGB(255, 87, 80, 80),
            )
          ],
        )
      ) ,
    );
  }
}