import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber}) {
    return Expanded(
        child: RaisedButton(
      highlightColor: Colors.redAccent,
      onPressed: () {
        playSound(soundNumber);
      },
      color: color,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(color: Colors.black, soundNumber: 1),
            buildKey(color: Colors.white, soundNumber: 2),
            buildKey(color: Colors.black, soundNumber: 3),
            buildKey(color: Colors.white, soundNumber: 4),
            buildKey(color: Colors.black, soundNumber: 5),
            buildKey(color: Colors.white, soundNumber: 6),
            buildKey(color: Colors.black, soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
