// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class BasketAppScreen extends StatefulWidget {
  const BasketAppScreen({super.key});

  @override
  State<BasketAppScreen> createState() => _BasketAppScreenState();
}

class _BasketAppScreenState extends State<BasketAppScreen> {
  int x = 0;
  int y = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Center(
        child: Column(
          children: [

            Container(
              alignment: Alignment.centerLeft,
              height: 45,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(color: Colors.orange, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 0, // How much the shadow spreads
                  blurRadius: 6, // How soft the shadow looks
                  offset: Offset(0, 4), // Shadow position (x, y)
                ),
              ]),
              child: Text(
                'Basketball points counter',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mycol('Team A', true),


                   Container(
                    height: 336,
                    child: VerticalDivider(
                      width: 50,
                      thickness: 2,


                    ),

                   ),


                    mycol('Team B', false),
                  ],
                )),



           Padding(padding: EdgeInsets.symmetric(vertical: 10),
           child:  MyBtn(
                data: 'Reset',
                onPressed: () {
                  setState(() {
                    x = 0;
                    y = 0;
                  });
                }),)
          ],
        ),
      ),
    )));
  }

  Column mycol(String data, bool t) {
   
    return Column(
      children: [
        Text(
          data,
          style: TextStyle(
              fontSize: 35, color: const Color.fromARGB(255, 81, 29, 25)),
        ),
        Text(
          t ? x.toString() : y.toString(),
          style: TextStyle(
            fontSize: 110,
          ),
        ),
        Container(
          child: Column(
            children: [
              MyBtn(
                  data: 'Add 1 Point',
                  onPressed: () {
                    setState(() {
                      if (t) {
                        x++;
                      } else {
                        y++;
                      }
                    });
                  }),
              MyBtn(
                  data: 'Add 2 Point',
                  onPressed: () {
                    setState(() {
                      if (t) {
                        x += 2;
                      } else {
                        y += 2;
                      }
                    });
                  }),
              MyBtn(
                  data: 'Add 3 Point',
                  onPressed: () {
                    setState(() {
                      if (t) {
                        x += 3;
                      } else {
                        y += 3;
                      }
                    });
                  })
            ],
          ),
        )
      ],
    );
  }
}

class MyBtn extends StatelessWidget {
  final void Function() onPressed;
  final String data;

  const MyBtn({required this.data, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      onPressed: onPressed,
      color: Colors.orange,
      child: Text(
        data,
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
