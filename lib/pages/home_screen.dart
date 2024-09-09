import 'package:flutter/material.dart';
import 'package:workshop/core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page',
      style: TextStyle(
        color: AppColor.white
      ),
      ),
      backgroundColor: AppColor.black,
      ),
      backgroundColor: AppColor.bg,
      body: const SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //! Remove the comment then add arguments 
          // StarterAppItem(),
          // StarterAppItem(),
          // StarterAppItem(),
          // StarterAppItem(),
        ],
      ),
      )),
    );
  }
}