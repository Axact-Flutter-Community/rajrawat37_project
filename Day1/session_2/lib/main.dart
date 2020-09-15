import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Second Session',
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('App Bar'),
          titleSpacing: 20.0,
          brightness: Brightness.light,
          centerTitle: false,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(Icons.menu),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.notifications),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.search),
              ),
            ),
          ],
          toolbarOpacity: 0.9,
          elevation: 20.0,
          toolbarHeight: 60.0,
          flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.red,
              Colors.purple,
              Colors.blue,
              Colors.green,
              Colors.orange,
            ])          
         ),        
     ),      
        ),
        body: ListView(
          children: <Widget>[
            Image.network('https://data.whicdn.com/images/335179342/original.jpg'),
              SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                  children:<Widget> [
                     Image.network('https://i.pinimg.com/originals/d1/b5/4a/d1b54a760ab2c599be9ea991b4427a09.jpg',height: 300,),
                      Image.network('https://i.pinimg.com/originals/ad/4e/2a/ad4e2a8876b01fd44ce3676352f2a7b0.jpg',height: 300,),
                       Image.network('https://cdn.shopify.com/s/files/1/1130/7582/products/beautiful_life.jpg?v=1556926864',height: 300,),
                       Image.network('https://ashleyvalot.com/wp-content/uploads/2019/02/Northern-Lights-Lake.jpg',height: 300,),
                  ],
               ),
            ),
            Image.network("https://www.wallpaperflare.com/static/425/299/604/space-stars-render-tylercreatesworlds-wallpaper.jpg"),
            Image.network("https://c4.wallpaperflare.com/wallpaper/388/355/755/abstract-colorful-universe-space-wallpaper-preview.jpg"),
            Image.network("https://data.whicdn.com/images/12178580/original.jpg"),
            Image.network("https://ak.picdn.net/shutterstock/videos/28363579/thumb/1.jpg"),
          
          ],
        ));
  }
}
