import 'package:flutter/material.dart';
import 'package:news_app/src/models/models.dart';

import 'home_slider.dart';
import 'latest_news.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    Key? key,
    required Future<NewsModel?> newsModel,
    required bool pinned,
    required bool snap,
    required bool floating,
  })  : _newsModel = newsModel,
        _pinned = pinned,
        _snap = snap,
        _floating = floating,
        super(key: key);

  final Future<NewsModel?> _newsModel;
  final bool _pinned;
  final bool _snap;
  final bool _floating;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
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
              leading: Text(" "),
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
                          Colors.black.withOpacity(0.3), BlendMode.dstATop),
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
                 leading: Text(" "),
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
                          Colors.black.withOpacity(0.3), BlendMode.dstATop),
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
                 leading: Text(" "),
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
                          Colors.black.withOpacity(0.3), BlendMode.dstATop),
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
                 leading: Text(" "),
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
                          Colors.black.withOpacity(0.3), BlendMode.dstATop),
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
                 leading: Text(" "),
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
                          Colors.black.withOpacity(0.3), BlendMode.dstATop),
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
    );
  }
}
