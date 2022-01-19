// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:news_app/src/views/ForgetPass/forget.dart';
import 'package:news_app/src/views/Sign_Up/sign_up_page.dart';
import 'Components/Banner.dart';
import 'Components/email.dart';
import 'Components/login_button.dart';

// ignore: use_key_in_widget_constructors
class MyLoginScreen extends StatefulWidget {
  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
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
        backgroundColor: Color(0xffffffff),
        toolbarHeight: 30.0,
        centerTitle: true,
        title: Text(
          'Sign In',
          style: TextStyle(
            color: Color(0xffFB8A30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Logo(),
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
                            hintText: "Password",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildRememberassword(),
                            buildForgetPassword(context),
                          ],
                        ),
                        LoginButton(
                            formkey: _formkey,
                            emailController: _emailController,
                            passController: _passController),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              // ignore: unnecessary_new
                              child: new Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 15.0),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 50,
                                  )),
                            ),
                            Text("OR"),
                            Expanded(
                              // ignore: unnecessary_new
                              child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 10.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 50,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildFacebook(),
                            SizedBox(
                              width: 20.0,
                            ),
                            buildGoogle(),
                            SizedBox(
                              width: 20.0,
                            ),
                            buildTwitter()
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUp_Page()));
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Don’t have an account? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                            TextSpan(
                              text: '  Register Now. ',
                              style: TextStyle(
                                color: Color(0xffFA9645),
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
