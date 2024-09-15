// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, curly_braces_in_flow_control_structures


import 'package:flutter/material.dart';

class XoApp extends StatefulWidget {
  const XoApp({super.key});
  @override
  State<XoApp> createState() => _XOAppScreenState();
}

class _XOAppScreenState extends State<XoApp> {
  String currect_player = 'X';
  List<String> game = ["", "", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 184, 170),
      body: SafeArea(
          child: Center(
        child: Column(
          //! the main column

          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: 
               Text('TIC TAC TOE',
                      style: fontshape(Colors.white, 35),
                      textHeightBehavior: TextHeightBehavior(
                        applyHeightToFirstAscent:
                            false, // Remove extra space on top
                        applyHeightToLastDescent:
                            false, // Remove extra space on bottom
                      )),
                 
              ),

              Text('...........................................',style: TextStyle(color:Color.fromARGB(255, 244, 194, 118),fontSize: 20 ),)
            
            ,Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: winner(currect_player, 'turn'),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          startgame(0);
                        },
                        child: btnshapes('one', game[0]),
                      ),
                      InkWell(
                        onTap: () {
                          startgame(1);
                        },
                        child: btnshapes('one', game[1]),
                      ),
                      InkWell(
                        onTap: () {
                          startgame(2);
                        },
                        child: btnshapes('two', game[2]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          startgame(3);
                        },
                        child: btnshapes('one', game[3]),
                      ),
                      InkWell(
                        onTap: () {
                          startgame(4);
                        },
                        child: btnshapes('one', game[4]),
                      ),
                      InkWell(
                        onTap: () {
                          startgame(5);
                        },
                        child: btnshapes('two', game[5]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            startgame(6);
                          },
                          child: btnshapes('three', game[6])),
                      InkWell(
                        onTap: () {
                          startgame(7);
                        },
                        child: btnshapes('three', game[7]),
                      ),
                      InkWell(
                        onTap: () {
                          startgame(8);
                        },
                        child: btnshapes('', game[8]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: InkWell(
                onTap: () {
                  setState(() {
                    game = List.filled(9, '', growable: false);
                    currect_player = 'X';
                  });
                },
                child: lastbtns('New Game'),
              ),
            ),
          ],
        ),
      )),
    );
  }

  TextSpan winner(String currect, String txt) {
    if (checkdraw()) {
      currect = 'Draw';
      txt = 'Game';
    } else if (checkwinner()) {
      currect = currect_player;
      txt = 'is Winner';
    }

    return TextSpan(
      children: [
        TextSpan(
          text: currect, // First part of the text
          style: TextStyle(
              color: Colors.white, fontSize: 30), // Style for the player text
        ),
        TextSpan(
          text: ' $txt', // Second part of the text
          style: TextStyle(
              color: Color.fromARGB(255, 43, 107, 98),
              fontSize: 30), // Style for the word 'turn'
        ),
      ],
    );
  }

  bool checkdraw() {
    // Game is a draw if no empty spots exist
    return !game.contains(""); // This returns true if there are no empty spaces
  }

  void startgame(int index) {
    setState(() {
      // Proceed if there's no winner and it's not a draw
      if (!checkwinner() && !checkdraw()&&game[index]=="") {
        fill_box(index);
        if (!checkwinner()) change_player();
      }
    });
  }

  void change_player() {
    if (currect_player == 'X')
      currect_player = 'O';
    else
      currect_player = 'X';
  }

  void fill_box(int index) {
    if (game[index] == "") {
      game[index] = currect_player;
    }
  }

  List<List<int>> winnercombo = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  bool checkwinner() {
    for (var comb in winnercombo) {
      if (game[comb[0]] == game[comb[1]] &&
          game[comb[1]] == game[comb[2]] &&
          game[comb[0]] != '') {
        return true;
      }
    }
    return false;
  }

  Container lastbtns(String txt) {
    return Container(
        color: Color.fromARGB(255, 56, 132, 122),
        alignment: Alignment.center,
        width: 220,
        height: 40,
        child: Text(
          txt,
          style: TextStyle(color: Colors.white),
        ));
  }

  Container btnshapes(String type, String data) {
    BoxDecoration decoration = BoxDecoration();

    if (type == 'one') {
      decoration = BoxDecoration(
          border: Border(
              right: BorderSide(
                  color: const Color.fromARGB(255, 244, 194, 118), width: 3),
              bottom: BorderSide(
                  color: const Color.fromARGB(255, 244, 194, 118), width: 3)));
    } else if (type == 'two') {
      decoration = BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: const Color.fromARGB(255, 244, 194, 118), width: 3)));
    } else if (type == 'three') {
      decoration = BoxDecoration(
          border: Border(
        right: BorderSide(
            color: const Color.fromARGB(255, 244, 194, 118), width: 3),
      ));
    }

    return Container(
      decoration: decoration,
      child: Text(
        data,
        style: TextStyle(fontSize: 50, color: Colors.white),
      ),
      alignment: Alignment.center,
      width: 90,
    );
  }

  TextStyle fontshape(Color color, double fontsize) {
    return TextStyle(
        color: color, fontSize: fontsize, fontWeight: FontWeight.bold);
  }
}
