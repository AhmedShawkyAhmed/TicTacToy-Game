import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/players.dart';
import 'package:tic_tac_toe/solo.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  Color TextColor = Colors.blue.shade500;

  // ignore: non_constant_identifier_names
  Color Background = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Container(
                    child: Text(
                      "Tic Tac Toy",
                      style: TextStyle(
                        fontSize: 50,
                        color: TextColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: AvatarGlow(
                    endRadius: 140,
                    duration: Duration(seconds: 3),
                    glowColor: TextColor,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.none,
                          ),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: Background,
                        child: Container(
                          child: Image.asset(
                            'lib/logo.png',
                            color: TextColor,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        radius: 80.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    child: Text(
                      "@ Ahmed Shawky",
                      style: TextStyle(
                        fontSize: 40,
                        color: TextColor,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Solo()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    bottom: 20,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: TextColor,
                      child: Center(
                        child: Text(
                          '1 Player',
                          style: TextStyle(
                            fontSize: 30,
                            color: Background,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Play()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    bottom: 40,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: TextColor,
                      child: Center(
                        child: Text(
                          '2 Players',
                          style: TextStyle(
                            fontSize: 30,
                            color: Background,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
