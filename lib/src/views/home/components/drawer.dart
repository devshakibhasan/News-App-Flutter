// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/src/views/home/components/about.dart';

class drawer extends StatelessWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              minRadius: 50.0,
              maxRadius: 50.0,
              backgroundImage: AssetImage("assets/images/shakib.png"),
            ),
            accountEmail: Text('mshpatwary160670@gmail.com'),
            accountName: Text(
              'Md. Shakib Hasan Patwary',
              style: TextStyle(fontSize: 24.0),
            ),
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 50.0,
            ),
            // ignore: prefer_const_constructors
            title: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xffFB8A30),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(
                context,
              );
            },
          ),
          ExpansionTile(
            leading: Image.asset("assets/logo/news.png"),
            title: const Text(
              'News',
              style: TextStyle(
                fontSize: 24.0,
                color: Color(0xffFB8A30),
              ),
            ),
            children: <Widget>[
              Container(
                height: 60.0,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "All News",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xffFB8A30),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: double.infinity,
                child: Card(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Business",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xffFB8A30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: double.infinity,
                child: Card(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "polictics",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xffFB8A30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: double.infinity,
                child: Card(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Tech",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xffFB8A30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: double.infinity,
                child: Card(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Science",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xffFB8A30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: double.infinity,
                child: Card(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Sports",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xffFB8A30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Image.asset("assets/logo/about.png"),
            title: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: const Text(
                'About Me',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xffFB8A30),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
