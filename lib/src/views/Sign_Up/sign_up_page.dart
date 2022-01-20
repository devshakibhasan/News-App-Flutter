// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:news_app/src/views/ForgetPass/forget.dart';
import 'Components/email.dart';
import 'components/SUBanner.dart';
import 'components/name.dart';
import 'components/sign_up_button.dart';

// ignore: use_key_in_widget_constructors
class SignUp_Page extends StatefulWidget {
  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  late TextEditingController _emailController;
  late TextEditingController _passController;
  late TextEditingController _nameController;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _nameController = TextEditingController();

    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
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
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xffFB8A30),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xffffffff),
        toolbarHeight: 50.0,
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Color(0xffFB8A30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: null,
        child: Column(
          children: [
            SUBanner(),
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "User Name",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Name_feild(nameController: _nameController),
                        SizedBox(
                          height: 10.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Email_feild(emailController: _emailController),
                        SizedBox(
                          height: 10.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
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
                        SignUp_Button(
                          formkey: _formkey,
                          emailController: _emailController,
                          passController: _passController,
                          nameController: _nameController,
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
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                            TextSpan(
                              text: '  Sign In ',
                              style: TextStyle(
                                color: Color(0xffFB8A30),
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
                activeColor:  Color(0xffFB8A30),
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
            color: Color(0xffFB8A30),
          ),
        ),
      ),
    );
  }
}
