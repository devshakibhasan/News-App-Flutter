// ignore_for_file: unnecessary_new, prefer_const_constructors, duplicate_ignore

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/pages/api_manager.dart';
import 'package:news_app/pages/newsinfo.dart';

import 'post_model.dart';

class bissiness extends StatefulWidget {
  @override
  _bissinessState createState() => _bissinessState();
}

class _bissinessState extends State<bissiness> {
  late Future<NewsModel?> _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder<NewsModel?>(
        future: _newsModel,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              // ignore: prefer_const_constructors
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.articles.length,
              itemBuilder: (BuildContext context, int index) {
                var article = snapshot.data.articles[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return NewsPage(article: article);
                          // return Scaffold(
                          //   // appBar: AppBar(
                          //   //   flexibleSpace: Stack(
                          //   //     children: <Widget>[
                          //   //       Image.network(
                          //   //         article.urlToImage,
                          //   //         fit: BoxFit.cover,
                          //   //       ),
                          //   //       Center(
                          //   //         child: Text(
                          //   //           // ignore: unnecessary_string_interpolations
                          //   //           "${article.title}",
                          //   //           style: TextStyle(
                          //   //             fontSize: 24.0,
                          //   //             fontWeight: FontWeight.bold,
                          //   //             backgroundColor: Colors.black45,
                          //   //             color: Colors.white,
                          //   //           ),
                          //   //         ),
                          //   //       ),
                          //   //     ],
                          //   //   ),
                          //   // ),
                          //   body: CustomScrollView(
                          //     slivers: [
                          //       SliverAppBar(
                          //         backgroundColor: Colors.white,
                          //         expandedHeight: 210.0,
                          //         floating: false,
                          //         pinned: true,
                          //         flexibleSpace: Padding(
                          //           padding: const EdgeInsets.only(top: 60.0),
                          //           child: FlexibleSpaceBar(
                          //             centerTitle: true,
                          //             title: Align(
                          //               alignment: Alignment.bottomCenter,
                          //               child: Padding(
                          //                 padding:
                          //                     const EdgeInsets.only(left: 20.0),
                          //                 child: Text(
                          //                   "${article.title}",
                          //                   // ignore: prefer_const_constructors
                          //                   style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 16.0,
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //             background: Container(
                          //               decoration: new BoxDecoration(
                          //                 color: Color(0xff434343),
                          //                 image: DecorationImage(
                          //                   fit: BoxFit.cover,
                          //                   colorFilter: ColorFilter.mode(
                          //                       Colors.black.withOpacity(0.2),
                          //                       BlendMode.dstATop),
                          //                   image: new NetworkImage(
                          //                     article.urlToImage,
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //             //                         background: Container(
                          //             //                           decoration: BoxDecoration(
                          //             //                             image: DecorationImage(image: image)
                          //             //                           ),
                          //             // //                            decoration: new BoxDecoration(
                          //             // // color: const Color(0xff7c94b6),
                          //             // // image:  DecorationImage(
                          //             // //   fit: BoxFit.cover,
                          //             // //   colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          //             //                           child: Image.network(

                          //             //                             article.urlToImage,
                          //             //                             fit: BoxFit.cover,

                          //             //                           ),
                          //             //                         ),
                          //           ),
                          //         ),
                          //       ),
                          //       // Anther sliver widget: SliverList
                          //       SliverList(
                          //         delegate: SliverChildListDelegate(
                          //           [
                          //             // ignore: sized_box_for_whitespace
                          //             Container(
                          //               height: 300,
                          //               color: Colors.white,
                          //               child: Text(
                          //                 '${article.description}',
                          //                 style: TextStyle(
                          //                   fontSize: 25.0,
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // );
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 150.0,
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0))),
                            child: Image.network(
                              article.urlToImage,
                              fit: BoxFit.fill,
                              height: 150.0,
                              width: 150.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${article.title}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text('${article.publishedAt}'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Data Not Found");
          }
          return Align(
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }
}

class NewsPage extends StatelessWidget {
  const NewsPage({
    Key? key,
    required this.article,
  });

  final  article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff434343),
            expandedHeight: 210.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "${article.title}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              background: Container(
                decoration: new BoxDecoration(
                  color: Color(0xff434343),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.dstATop),
                    image: new NetworkImage(
                      article.urlToImage,
                    ),
                  ),
                ),
              ),
            ),
            leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                color: Color(0xffFB8A30),
                size: 40.0,
              ),
            ),
          ),
          // Anther sliver widget: SliverList
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // ignore: sized_box_for_whitespace

                Container(
                  height: 1000,
                  color: Colors.white,
                  child: Text(
                    '${article.description}',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
