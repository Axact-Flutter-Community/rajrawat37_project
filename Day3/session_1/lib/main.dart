import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Dice Game',
    home: DiceGame(),
  ));
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int first = 1;
  int second = 2;
  int third = 3;
  int fourth = 4;
  void dice() {
    setState(() {
      first = Random().nextInt(6) + 1;
      second = Random().nextInt(6) + 1;
      third = Random().nextInt(6) + 1;
      fourth = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: new AppBar(
        title: new Text('Dice Game'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    print('I was pressed');
                    dice();
                  },
                  child: Image.asset('images/dice$first.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    print('I was pressed');
                    dice();
                  },
                  child: Image.asset('images/dice$second.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    print('I was pressed');
                    dice();
                  },
                  child: Image.asset('images/dice$third.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    print('I was pressed');
                    dice();
                  },
                  child: Image.asset('images/dice$fourth.png'),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
