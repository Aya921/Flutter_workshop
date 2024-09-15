// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member

import 'package:flutter/material.dart';

class LighterScreen extends StatefulWidget {
  const LighterScreen({super.key});

  @override
  State<LighterScreen> createState() => _LighterScreenState();
}

class _LighterScreenState extends State<LighterScreen> {
  @override
   bool switcher = false;
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Icon(
            Icons.lightbulb,
           
            color: switcher ? Colors.orange : Colors.grey,
            size: 100,
          ),
          const SizedBox(width: 40),


          MaterialButton(onPressed: () {
            setState(() {
              switcher = !switcher;
            });
          },
          color: switcher?Colors.red:Colors.green,
          child: Text(switcher?'off':'on', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white


          
            
            ),),
          )
        ],
      ),
      )
    ));
  }
}