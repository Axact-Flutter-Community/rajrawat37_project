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

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 55,
          backgroundColor: Colors.green,
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            tabs: [
              new Tab(icon: new Icon(Icons.home)),
              new Tab(
                icon: new Icon(Icons.trending_up),
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
                            return Flexible(
                                //color: Colors.white10,
                                child: Column(
                              children: <Widget>[
                                Container(
                                    height:
                                        (h - AppBar().preferredSize.height) / 2,
                                    child: Image.network(
                                      snapshot.data[index]['urlToImage'],
                                      fit: BoxFit.cover,
                                    )),
                                Container(
                                  height:
                                      (h - AppBar().preferredSize.height) / 8,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      snapshot.data[index]['title'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 17,
                                      ),
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  height:
                                      (h - AppBar().preferredSize.height) / 5,
                                  child: Text(
                                    snapshot.data[index]['content'].toString(),
                                    style: GoogleFonts.alef(fontSize: 15),
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Divider(),
                                InkWell(
                                  child: Text(
                                    "Link",
                                    style: TextStyle(
                                        color: Colors.blueAccent[400]),
                                    overflow: TextOverflow.clip,
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
              icon: Icon(Icons.arrow_drop_down_circle),
              title: Text('News'),
            ),
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
          backgroundColor: Colors.green,
          iconSize: 25,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
        ));
  }
}
