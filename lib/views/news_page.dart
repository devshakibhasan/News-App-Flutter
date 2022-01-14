// ignore_for_file: unnecessary_new, prefer_const_constructors, duplicate_ignore
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/controllers/home_api_controller.dart';
import 'package:news_app/models/models.dart';



class bissiness extends StatefulWidget {
  @override
  _bissinessState createState() => _bissinessState();
}

class _bissinessState extends State<bissiness> {
  late Future<NewsModel?> _newsModel;

  @override
  void initState() {
    _newsModel = HomeController().getNews();
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
