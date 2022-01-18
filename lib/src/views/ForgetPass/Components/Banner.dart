// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class LBanner extends StatelessWidget {
  const LBanner({
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
                  "Mail Address Here",
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
                  "Enter the email address associated with your account",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff172331),
                  ),
                ),
                Text(
                  "with your account",
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
