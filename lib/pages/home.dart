// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'api_test.dart';
import 'package:news_app/pages/api_manager.dart';
import 'package:news_app/pages/newsinfo.dart';
import 'post_model.dart';
import 'string.dart';

final List<String> imagesList = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_180.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
];

final List<String> titles = [
  ' Coffee ',
  ' Bread ',
  ' Gelato ',
  ' Ice Cream ',
];

class API_Manager {
  Future<NewsModel?> getNews() async {
    var client = http.Client();
    var newsModel = null;
    try {
      var response = await client.get(Uri.parse(Strings.news_url));

      if (response.statusCode == 200) {
        var jesonString = response.body;
        var jsonMap = json.decode(jesonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}

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
    _newsModel = API_Manager().getNews();
    super.initState();
  }

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
            // This CustomScrollView display the Home tab content
            CustomScrollView(
              slivers: [
                // Anther sliver widget: SliverList
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
                                        //for onTap to redirect to another screen
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
                        // child: FutureBuilder(
                        //   future: _newsModel,
                        //   builder:
                        //       (BuildContext context, AsyncSnapshot snapshot) {
                        //     if (snapshot.hasData) {
                        //       return
                        //     } else if (snapshot.hasError) {
                        //       throw Exception("ERROR");
                        //     }
                        //     return Center(child: CircularProgressIndicator());
                        //   },
                        // ),
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
                // Anther sliver widget: SliverList
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
                // Anther sliver widget: SliverList
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

// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // This function show the sliver app bar

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         bottom: TabBar(
//             tabs: [
//               Tab(text: "Flights", icon: Icon(Icons.flight),),
//               Tab(text: "Trains", icon: Icon(Icons.train)),
//               Tab(text: "Hotels",icon: Icon(Icons.restaurant)),
//               Tab(text: "Hotels",icon: Icon(Icons.restaurant)),
//             ],
//           ),
//       ),

//         body: DefaultTabController(
//       length: 4,
//       child: TabBarView(children: [
//         // This CustomScrollView display the Home tab content
//         CustomScrollView(
//           slivers: [

//             // Anther sliver widget: SliverList
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 Container(
//                   height: 400,
//                   child: Center(
//                     child: Text(
//                       'Home Tab',
//                       style: TextStyle(fontSize: 40),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 1500,
//                   color: Colors.green,
//                 ),
//               ]),
//             ),
//           ],
//         ),
//         CustomScrollView(
//           slivers: [

//             // Anther sliver widget: SliverList
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 Container(
//                   height: 400,
//                   child: Center(
//                     child: Text(
//                       'Home Tab',
//                       style: TextStyle(fontSize: 40),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 1500,
//                   color: Colors.green,
//                 ),
//               ]),
//             ),
//           ],
//         ),
//         CustomScrollView(
//           slivers: [

//             // Anther sliver widget: SliverList
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 Container(
//                   height: 400,
//                   child: Center(
//                     child: Text(
//                       'Home Tab',
//                       style: TextStyle(fontSize: 40),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 1500,
//                   color: Colors.green,
//                 ),
//               ]),
//             ),
//           ],
//         ),

//         // This shows the Settings tab content
//         CustomScrollView(
//           slivers: [

//             // Show other sliver stuff
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 Container(
//                   height: 600,
//                   color: Colors.blue[200],
//                   child: Center(
//                     child: Text(
//                       'Settings Tab',
//                       style: TextStyle(fontSize: 40),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 1200,
//                   color: Colors.pink,
//                 ),
//               ]),
//             ),
//           ],
//         )
//       ]),
//     ));
//   }
// }
