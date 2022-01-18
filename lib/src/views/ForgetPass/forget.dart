// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore: unused_import

import 'package:flutter/material.dart';
import 'Components/Banner.dart';
import 'Components/email.dart';
import 'Components/forget_button.dart';

// ignore: use_key_in_widget_constructors
class MyForgetScreen extends StatefulWidget {
  @override
  State<MyForgetScreen> createState() => _MyForgetScreenState();
}

class _MyForgetScreenState extends State<MyForgetScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passController;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();

    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
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
        title: Text('Forgot Password'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: null,
        child: Column(
          children: [
            LBanner(),
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
                        Email_feild(emailController: _emailController),
                        SizedBox(
                          height: 20.0,
                        ),
                        ForgetPassButton(
                            formkey: _formkey,
                            emailController: _emailController,
                            passController: _passController),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 177.0),
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
}
