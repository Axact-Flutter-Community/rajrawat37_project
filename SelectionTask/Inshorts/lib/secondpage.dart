import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Container(
              width: 200,
              color: Colors.red,
              child: Image.asset('images/card1.jpeg'),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 200,
              child: Image.asset('images/card2.jpeg'),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 200,
              child: Image.asset('images/card3.jpeg'),
            )
          ],
        ),
      ),
      Row(
        children: [
          Expanded(
            child: Image.asset('images/s1.jpeg'),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Image.asset('images/s2.jpeg'),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: Image.asset('images/s4.jpeg'),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Image.asset('images/s5.jpeg'),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: Image.asset('images/s6.jpeg'),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Image.asset('images/s7.jpeg'),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ]));
  }
}
