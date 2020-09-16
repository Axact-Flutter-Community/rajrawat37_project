import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                          child: Divider(
                            color: Colors.black,
                          ),
                          width: 200,
                        ),
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('images/dp.jpg'),
                        ),
                        Text(
                          "Raj",
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                          child: Divider(
                            color: Colors.black,
                          ),
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: ListTile(
                    leading: Icon(Icons.call),
                    title: Text(
                      "+91 8650897835",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text(
                      "rawatraj995@gmail.com",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        color: Colors.black,
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
