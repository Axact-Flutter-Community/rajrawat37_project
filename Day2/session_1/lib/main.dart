import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
            //mainAxisSize: MainAxisSize.min,
            //verticalDirection: VerticalDirection.up,
            //mainAxisAlignment: MainAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
              Container(
                margin: EdgeInsets.only(top: 60, bottom: 50),
                width: 100,
                height: 600,
                color: Colors.deepOrange,
              ),
              SizedBox(width: 30,height: 600,),
              Column(
                 children:<Widget> [
                    Container(
                      margin: EdgeInsets.only(top: 300),
                      color: Colors.yellow,
                       height: 100,
                       width: 100,
                    ),
                    Container(
                      color: Colors.green,
                       height: 100,
                       width: 100,
                    ),
                 ],
              ),
              SizedBox(width: 30,height: 600,),
                Container(
                margin: EdgeInsets.only(top: 60, bottom: 50),
                width: 100,
                height: 600,
                color: Colors.blue,
              ),
            ],
      ),
    );
  }
}
