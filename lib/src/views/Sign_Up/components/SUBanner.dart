// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class SUBanner extends StatelessWidget {
  const SUBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          fit: BoxFit.cover,
          height: 125.0,
          width: double.infinity,
          // ignore: prefer_const_constructors
          image: AssetImage(
            "assets/images/Sign_in.jpg",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Sign up to continue.",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000),
                  ),
                ),
                
              ],
            ),
          ),
        )
      ],
    );
  }
}
