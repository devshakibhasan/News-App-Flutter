// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:news_app/src/controllers/home_api_controller.dart';
import 'package:news_app/src/models/models.dart';
import 'dart:async';
import 'components/home_slider.dart';
import 'components/latest_news.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: prefer_final_fields
  bool _pinned = true;
  // ignore: prefer_final_fields
  bool _snap = false;
  bool _floating = false;
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
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'World News',
            style: TextStyle(
              color: Color(0xffFB8A30),
              fontFamily: 'Poppins',
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
                    child: Text(
                      'All News',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Business',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'polictics',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Tech',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Science',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Sports',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
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
                        height: 370.0,
                        child: HomeSlider(newsModel: _newsModel),
                      ),

                      Container(
                        height: 3000,
                        color: Colors.white,
                        child: Latest_news(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: _pinned,
                  snap: _snap,
                  floating: _floating,
                  backgroundColor: Color(0xffeaa36a),
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Business News",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    background: Container(
                      // ignore: unnecessary_new
                      decoration: new BoxDecoration(
                        color: Color(0xff434343),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          // ignore: unnecessary_new
                          image: NetworkImage(
                            "https://static.dw.com/image/47219195_401.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 2200,
                      child: Latest_news(),
                    ),
                  ]),
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
                      "Political News",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    background: Container(
                      // ignore: unnecessary_new
                      decoration: new BoxDecoration(
                        color: Color(0xff434343),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          // ignore: unnecessary_new
                          image: NetworkImage(
                            "https://cdn5.vectorstock.com/i/1000x1000/57/94/mass-media-political-news-breaking-news-banner-vector-15085794.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 2200,
                      child: Latest_news(),
                    ),
                  ]),
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
                      "Technology News",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    background: Container(
                      // ignore: unnecessary_new
                      decoration: new BoxDecoration(
                        color: Color(0xff434343),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          // ignore: unnecessary_new
                          image: NetworkImage(
                            "https://podcastaddict.com/cache/artwork/thumb/2268459",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: 2200,
                        child: Latest_news(),
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
                      "Seicence News",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    background: Container(
                      // ignore: unnecessary_new
                      decoration: new BoxDecoration(
                        color: Color(0xff434343),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          // ignore: unnecessary_new
                          image: NetworkImage(
                            "https://www.sciencenews.org/wp-content/uploads/2019/12/120719_cover-445x575.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 2200,
                      child: Latest_news(),
                    ),
                  ]),
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
                      "Sports News",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    background: Container(
                      // ignore: unnecessary_new
                      decoration: new BoxDecoration(
                        color: Color(0xff434343),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          // ignore: unnecessary_new
                          image: NetworkImage(
                            "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2019/10/live-sports-news-1-1571384768.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 2200,
                      child: Latest_news(),
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
