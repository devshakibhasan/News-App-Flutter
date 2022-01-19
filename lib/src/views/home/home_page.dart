// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:news_app/src/controllers/home_api_controller.dart';
import 'package:news_app/src/models/models.dart';
import 'dart:async';
import 'components/drawer.dart';
import 'components/home.dart';
import 'components/home_slider.dart';
import 'components/latest_news.dart';
import 'components/tablist.dart';

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
          iconTheme: IconThemeData(color: Color(0xffFB8A30), size: 30.0),
          centerTitle: true,
          title: Text(
            'World News',
            style: TextStyle(
              color: Color(0xffFB8A30),
              fontFamily: 'Poppins',
              fontSize: 23.0,
            ),
          ),
          elevation: 0.0,
          toolbarHeight: 80.0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              child: tablist(),
              preferredSize: Size.fromHeight(30.0)),
        ),
        drawer: drawer(),
        body: Homepage(newsModel: _newsModel, pinned: _pinned, snap: _snap, floating: _floating),
      ),
    );
  }
}
