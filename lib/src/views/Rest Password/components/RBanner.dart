// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, file_names

import 'package:flutter/material.dart';

class RBanner extends StatelessWidget {
  const RBanner({
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
                  "Enter New Password",
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
                  "Your new password must be different",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff172331),
                  ),
                ),
                Text(
                  "from previously used password.",
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
