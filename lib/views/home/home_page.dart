// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/controllers/home_api_controller.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/views/news_page.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<NewsModel?> _newsModel;

  @override
  void initState() {
    _newsModel = HomeController().getNews();
    super.initState();
  }

  // ignore: prefer_final_fields, unused_field
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'News App',
            style: TextStyle(
              color: Color(0xffFB8A30),
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelColor: Colors.black,
                indicatorColor: Color(0xffFB8A30),
                indicatorWeight: 5.0,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Text('All News'),
                  ),
                  Tab(
                    child: Text('Business'),
                  ),
                  Tab(
                    child: Text('polictics'),
                  ),
                  Tab(
                    child: Text('Tech'),
                  ),
                  Tab(
                    child: Text('Science'),
                  ),
                  Tab(
                    child: Text('Sports'),
                  ),
                  Tab(
                    child: Text('Trade'),
                  ),
                  Tab(
                    child: Text('Current Balance'),
                  ),
                  Tab(
                    child: Text('Tab 5'),
                  ),
                  Tab(
                    child: Text('Tab 6'),
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(30.0)),
        ),
        body: TabBarView(
          children: [
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 360.0,
                        child: Column(
                          children: [
                            FutureBuilder(
                              future: _newsModel,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    margin: EdgeInsets.all(15),
                                    child: CarouselSlider.builder(
                                      itemCount: snapshot.data.articles.length,
                                      options: CarouselOptions(
                                        enlargeCenterPage: true,
                                        height: 250,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 3),
                                        reverse: false,
                                        aspectRatio: 5.0,
                                      ),
                                      itemBuilder: (context, i, id) {
                                        var article = snapshot.data.articles[i];

                                        return GestureDetector(
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: new BoxDecoration(
                                                  color: Color(0xff434343),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            Colors
                                                                .black
                                                                .withOpacity(
                                                                    0.4),
                                                            BlendMode.dstATop),
                                                    image: new NetworkImage(
                                                      article.urlToImage,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Text(
                                                    "${article.title}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return NewsPage(article: article);
                                            }));
                                          },
                                        );
                                      },
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  throw Text("Exrror");
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: _newsModel.((urlOfItem) {
                            //     int index = imagesList.indexOf(urlOfItem);
                            //     return Container(
                            //       width: 10.0,
                            //       height: 10.0,
                            //       margin: EdgeInsets.symmetric(
                            //           vertical: 10.0, horizontal: 2.0),
                            //       decoration: BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         color: _currentIndex == index
                            //             ? Color(0xffFB8A30)
                            //             : Color.fromRGBO(0, 0, 0, 0.3),
                            //       ),
                            //     );
                            //   }).toList(),
                            // ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Latest news",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        height: 3000,
                        color: Colors.white,
                        child: bissiness(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Color(0xffeaa36a),
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Collapsing Toolbar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 2200,
                      child: bissiness(),
                    ),
                  ]),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 400,
                      child: Center(
                        child: Text(
                          'Home Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1500,
                      color: Colors.green,
                    ),
                  ]),
                ),
              ],
            ),

            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 600,
                      color: Colors.blue[200],
                      child: Center(
                        child: Text(
                          'Settings Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.pink,
                    ),
                  ]),
                ),
              ],
            ),

            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 600,
                      color: Colors.blue[200],
                      child: Center(
                        child: Text(
                          'Settings Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.pink,
                    ),
                  ]),
                ),
              ],
            ),

            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 600,
                      color: Colors.blue[200],
                      child: Center(
                        child: Text(
                          'Settings Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.pink,
                    ),
                  ]),
                ),
              ],
            ),

            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 600,
                      color: Colors.blue[200],
                      child: Center(
                        child: Text(
                          'Settings Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.pink,
                    ),
                  ]),
                ),
              ],
            ),
            // This shows the Settings tab content
            CustomScrollView(
              slivers: [
                // Show other sliver stuff
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 600,
                      color: Colors.blue[200],
                      child: Center(
                        child: Text(
                          'Settings Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.pink,
                    ),
                  ]),
                ),
              ],
            ),

            CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 600,
                      color: Colors.blue[200],
                      child: Center(
                        child: Text(
                          'Settings Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.pink,
                    ),
                  ]),
                ),
              ],
            ),
            // This shows the Settings tab content
            CustomScrollView(
              slivers: [
                // Show other sliver stuff
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 600,
                      color: Colors.blue[200],
                      child: Center(
                        child: Text(
                          'Settings Tab',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 1200,
                      color: Colors.pink,
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
