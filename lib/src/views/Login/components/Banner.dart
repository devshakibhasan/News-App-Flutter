// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: Image(
            fit: BoxFit.cover,
            height: 250.0,
            width: double.infinity,
            // ignore: prefer_const_constructors
            image: AssetImage(
              "assets/images/wlb.png",
            ),
          ),
        ),
     
      ],
    );
  }
}
