// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:news_app/src/views/ForgetPass/forget.dart';
import 'components/RBanner.dart';
import 'components/reset_button.dart';

// ignore: use_key_in_widget_constructors
class Reset_Pass_test extends StatefulWidget {
  @override
  State<Reset_Pass_test> createState() => _Reset_Pass_testState();
}

class _Reset_Pass_testState extends State<Reset_Pass_test> {
  late TextEditingController _passController;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _passController = TextEditingController();

    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  bool rememberpwd = false;
  bool sec = true;
  var visable = Icon(
    Icons.visibility,
    color: Color(0xffC6C8D4),
  );
  var visableoff = Icon(
    Icons.visibility_off,
    color: Color(0xffC6C8D4),
  );
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff555FD2),
        toolbarHeight: 30.0,
        centerTitle: true,
        title: Text('Reset Password'),
      ),
      body: SingleChildScrollView(
        controller: null,
        child: Column(
          children: [
            RBanner(),
            SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          obscureText: sec,
                          controller: _passController,
                          validator: (val) => val!.length < 6
                              ? "Enter more than 6 digit charecter"
                              : null,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  sec = !sec;
                                });
                              },
                              icon: sec ? visableoff : visable,
                            ),
                            hintText: "Enter New Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          obscureText: sec,
                          controller: _passController,
                          validator: (val) => val!.length < 6
                              ? "Enter more than 6 digit charecter"
                              : null,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  sec = !sec;
                                });
                              },
                              icon: sec ? visableoff : visable,
                            ),
                            hintText: "Confirm your Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RestButton(
                          formkey: _formkey,
                          passController: _passController,
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Image(
                fit: BoxFit.cover,
                height: 175.0,
                width: double.infinity,
                // ignore: prefer_const_constructors
                image: AssetImage(
                  "assets/images/Sign_in_1.jpg",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRememberassword() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Color(0xffCFD1DB)),
              child: Checkbox(
                value: rememberpwd,
                checkColor: Colors.white,
                activeColor: Color(0xff555FD2),
                onChanged: (value) {
                  setState(() {
                    rememberpwd = value!;
                  });
                },
              )),
          Text(
            "Remember me",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(
                0xff8c8fa5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForgetPassword(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyForgetScreen()));
        },
        child: Text(
          "Forget Password !",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff555fd2),
          ),
        ),
      ),
    );
  }

  Widget buildFacebook() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset("assets/logo/facebook.png"),
    );
  }

  Widget buildGoogle() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset("assets/logo/search.png"),
    );
  }

  Widget buildTwitter() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset("assets/logo/twitter.png"),
    );
  }
}
