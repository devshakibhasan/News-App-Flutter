// ignore_for_file: unnecessary_new, prefer_const_constructors, duplicate_ignore
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/src/controllers/home_api_controller.dart';
import 'package:news_app/src/models/models.dart';

import 'news_page_view.dart';

class Latest_news extends StatefulWidget {
  @override
  _Latest_newsState createState() => _Latest_newsState();
}

class _Latest_newsState extends State<Latest_news> {
  late Future<NewsModel?> _newsModel;

  @override
  void initState() {
    _newsModel = HomeController().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
                            return NewsPageView(article: article);
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(150.0),
                        ),
                      ),
                      height: 150.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Card(
                          elevation: 5.0,
                          child: Row(
                            children: <Widget>[
                              Container(
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
                                          fontFamily: 'Poppins-R',
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        '${article.publishedAt}',
                                        style: TextStyle(
                                          fontFamily: 'Poppins-R',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
              child: CircularProgressIndicator( color: Color(0xffFB8A30),),
            );
          },
      ),
    ),
        ));
  }
}
