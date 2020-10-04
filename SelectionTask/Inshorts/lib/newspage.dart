import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import './secondpage.dart' as secondpage;
import 'dart:convert';
import 'dart:async';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  final String api =
      "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ce82909487c04a77a0bb36d6b057bda0";

  Future<List<dynamic>> fetchUser() async {
    var result = await http.get(api);
    var data = json.decode(result.body)['articles'];
    return data;
  }

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    PageController _controller = PageController(
      initialPage: 0,
    );
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    double h = MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 65,
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.amber,
            tabs: [
              new Tab(icon: new Icon(Icons.call)),
              new Tab(
                icon: new Icon(Icons.chat),
              ),
            ],
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          bottomOpacity: 1,
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            SafeArea(
              child: Container(
                child: FutureBuilder(
                    future: fetchUser(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null)
                        return Center(
                          child: Image.asset('images/load.jpeg'),
                        );
                      else {
                        return PageView.builder(
                          allowImplicitScrolling: false,
                          controller: _controller,
                          itemCount: 10,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Expanded(
                                //color: Colors.white10,
                                child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                      child: Image.network(
                                    snapshot.data[index]['urlToImage'],
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 8),
                                        child: Text(
                                          snapshot.data[index]['title'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 20,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          snapshot.data[index]['content'],
                                          style: GoogleFonts.alef(fontSize: 15),
                                        ),
                                      ),
                                      Divider(),
                                      InkWell(
                                        child: Text(
                                          "Link",
                                          style: TextStyle(
                                              color: Colors.blueAccent[400]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                          },
                        );
                      }
                    }),
              ),
            ),
            new secondpage.SecondPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              title: Text('Share'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              title: Text('Bookmark'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black,
        ));
  }
}
