import 'package:flutter/material.dart';
import 'dart:math';

class Solo extends StatefulWidget {
  @override
  _SoloState createState() => _SoloState();
}

class _SoloState extends State<Solo> {
  List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool ohTurn = true; // the first player is O!
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  var currentPlayer = 'O';
  int draw = 1;

  // ignore: non_constant_identifier_names
  Color TextColor = Colors.blue.shade500;

  // ignore: non_constant_identifier_names
  Color Background = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Player O ',
                          style: TextStyle(
                            color: TextColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          oScore.toString(),
                          style: TextStyle(
                            color: TextColor,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Player X ',
                          style: TextStyle(
                            color: TextColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          xScore.toString(),
                          style: TextStyle(
                            color: TextColor,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current Player $currentPlayer',
                style: TextStyle(
                  color: TextColor,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TextColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        displayExOh[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _auto() {
    setState(() {
      Random random = new Random();
      int range = random.nextInt(10) + 1;
      if (!ohTurn && displayExOh[range] == '') {
        displayExOh[range] = 'X';
        filledBoxes += 1;
        ohTurn = !ohTurn;
      }
    });
  }

  void _tapped(int index) {
    setState(
      () {
        if (ohTurn && displayExOh[index] == '') {
          displayExOh[index] = 'O';
          filledBoxes += 1;
          ohTurn = !ohTurn;
          _auto();
        }
        _checkWinner();
      },
    );
  }

  void _checkWinner() {
    // checks 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
      draw = 0;
    }

    // checks 2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
      draw = 0;
    }

    // checks 3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
      draw = 0;
    }

    // checks 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
      draw = 0;
    }

    // checks 2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
      draw = 0;
    }

    // checks 3rd column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
      draw = 0;
    }

    // checks diagonal
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
      draw = 0;
    }

    // checks diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
      draw = 0;
    }
    // check draw
    if (filledBoxes == 9 && draw == 1) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: TextColor,
          title: Text(
            'DRAW 😐',
            style: TextStyle(
              color: Background,
            ),
          ),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'Play Again!',
                style: TextStyle(
                  color: Background,
                ),
              ),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
                draw = 1;
              },
            )
          ],
        );
      },
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: TextColor,
          title: Text(
            'WINNER IS: $winner 🎉',
            style: TextStyle(
              color: Background,
            ),
          ),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'Play Again!',
                style: TextStyle(
                  color: Background,
                ),
              ),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
                draw = 1;
              },
            )
          ],
        );
      },
    );

    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }

  void _clearBoard() {
    setState(
      () {
        for (int i = 0; i < 9; i++) {
          displayExOh[i] = '';
        }
      },
    );
    filledBoxes = 0;
  }
}
