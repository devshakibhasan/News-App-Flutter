// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() => runApp(NewsApp());

// ignore: use_key_in_widget_constructors
class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}