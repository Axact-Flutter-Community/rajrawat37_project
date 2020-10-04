import 'package:flutter/material.dart';
import './firstpage.dart' as firstpage;
import './secondpage.dart' as secondpage;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: new Text('Medbot'),
            centerTitle: true,

            backgroundColor: Colors.red,

            bottom: new TabBar(controller: controller, tabs: <Widget>[
              new Tab(
               icon: Icon(Icons.menu),
               
              ),
              new Tab(
                   icon: Icon(Icons.mic),
              ),
              new Tab(
                icon: Icon(Icons.notifications),
              )
            ])),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new firstpage.FirstPage(),
            new secondpage.SecondPage(),
          ],
        ));
  }
}
