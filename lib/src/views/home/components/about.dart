// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../home_page.dart';
import 'latest_news.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    // ignore: prefer_final_fields
    bool _snap = false;
    bool _floating = false;

    // ignore: prefer_final_fields, unused_field

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xffFB8A30),
            size: 30.0,
          ),
        ),
        title: Text(
          'About Me',
          style: TextStyle(
            color: Color(0xffFB8A30),
            fontFamily: 'Poppins',
            fontSize: 23.0,
          ),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 350,
                  // ignore: unnecessary_new
                  decoration: new BoxDecoration(
                    color: Color(0xff434343),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.dstATop),
                      // ignore: unnecessary_new
                      image: AssetImage(
                        "assets/images/about.jfif",
                      ),
                    ),
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            minRadius: 60.0,
                            maxRadius: 60.0,
                            backgroundImage:
                                AssetImage("assets/images/shakib.png"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "I'M Shakib Hasan",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Text(
                          "Mobile App Developer",
                          style: TextStyle(
                            color: Color(0xffFB8A30),
                            fontSize: 25.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 450,
                  child: ListView.custom(
                    physics: NeverScrollableScrollPhysics(),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(top: 30.0),
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Card(
                                child: ListTile(
                                  title: Text(
                                    "Job Title",
                                    style: TextStyle(
                                      color: Color(0xffFB8A30),
                                      fontSize: 20.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Mobile App Developer / Flutter Developer",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text(
                                    "Name",
                                    style: TextStyle(
                                      color: Color(0xffFB8A30),
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Md. Shakib Hasan Patwary",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text(
                                    "Sex",
                                    style: TextStyle(
                                      color: Color(0xffFB8A30),
                                      fontSize: 20.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Male",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text(
                                    "Address",
                                    style: TextStyle(
                                      color: Color(0xffFB8A30),
                                      fontSize: 20.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Chittagong Road, Siddirganj, Narayanganj",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text(
                                    "Email Address",
                                    style: TextStyle(
                                      color: Color(0xffFB8A30),
                                      fontSize: 20.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  subtitle: Text(
                                    "mshpatwary160670@gmail.com",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  // child: ListView.custom(childrenDelegate: childrenDelegate)(
                  //   itemCount: 6,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Container(
                  //       color: Colors.amberAccent,
                  //       child: ListTile(
                  //         title: Text("Job Title"),
                  //         subtitle: Text("Mobile App Developer / Flutter Developer"),
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
