import 'dart:io';

import 'package:flutter/material.dart';

class Full_News extends StatelessWidget {
  const Full_News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
            delegate: SliverChildListDelegate(
              [
                // ignore: sized_box_for_whitespace
               
                Container(
                  height: 3000,
                  color: Colors.white,
                  child: Text("data"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
