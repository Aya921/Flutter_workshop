// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class BasketAppScreen extends StatefulWidget {
  const BasketAppScreen({super.key});

  @override
  State<BasketAppScreen> createState() => _BasketAppScreenState();
}

class _BasketAppScreenState extends State<BasketAppScreen> {
  int a = 0, b = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Basketball Points Counter",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 45, 20, 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Team A",
                        style: TextStyle(
                          fontSize: 43,
                        )),
                    Text("$a",
                        style: TextStyle(
                          fontSize: 170,
                        )),
                    Container(
                      height: 175,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          btn(
                              onPressed: () {
                                setState(() {
                                  a += 1;
                                });
                              },
                              data: "Add 1 Point "),
                          btn(
                              onPressed: () {
                                setState(() {
                                  a += 2;
                                });
                              },
                              data: "Add 2 Point "),
                          btn(
                              onPressed: () {
                                setState(() {
                                  a += 3;
                                });
                              },
                              data: "Add 3 Point ")
                        ],
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.black, 
                  thickness: 2, 
                //   indent: 30, 
                //   endIndent: 15, 
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Team B",
                        style: TextStyle(
                          fontSize: 43,
                        )),
                        
                    Text("$b",
                        style: TextStyle(
                          fontSize: 170,
                        )),
                    Container(
                      height: 175,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          btn(
                              onPressed: () {
                                setState(() {
                                  b += 1;
                                });
                              },
                              data: "Add 1 Point "),
                          btn(
                              onPressed: () {
                                setState(() {
                                  b += 2;
                                });
                              },
                              data: "Add 2 Point "),

                          btn(
                              onPressed: () {
                                setState(() {
                                  b += 3;
                                });
                              },
                              data: "Add 3 Point "),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 80,
            ),
            btn(
                onPressed: () {
                  setState(() {
                    a = 0;
                    b = 0;
                  });
                },
                data: "Reset"),
          ],
        ),
      ),
    );
  }

  MaterialButton btn(
      {required void Function()? onPressed, required String data}) {
    return MaterialButton(
      height: 45,
      onPressed: onPressed,
      color: Colors.orange,
      child: Text(data,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }
}
