import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Axact Studios',
                style: TextStyle(
                    color: Colors.redAccent,
                    backgroundColor: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 60)),
            Text(
              'Axact Studios',
              style: GoogleFonts.pinyonScript(
                fontSize: 50,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Axact Studios',
              style: GoogleFonts.shadowsIntoLight(
                color: Colors.green,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFeatures: [ui.FontFeature.randomize()],
              ),
            ),
            Text(
              'Axact Studios!',
              style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..shader = ui.Gradient.linear(
                    const Offset(0, 20),
                    const Offset(150, 20),
                    <Color>[
                      Colors.purple,
                      Colors.blue,
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
