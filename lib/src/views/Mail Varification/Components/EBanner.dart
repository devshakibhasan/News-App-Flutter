// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class EBanner extends StatelessWidget {
  const EBanner({
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
                  "Get Your Code",
                  style: TextStyle(
                    color: Color(0xff555FD2),
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Please enter the 4 digit code sent",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff172331),
                  ),
                ),
                Text(
                  "to your email address.",
                  style: TextStyle(
                    color: Color(0xff172331),
                    fontSize: 15.0,
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
