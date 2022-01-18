// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'Components/EBanner.dart';
import 'Components/varify_button.dart';

// ignore: use_key_in_widget_constructors
class Email_varification extends StatefulWidget {
  @override
  State<Email_varification> createState() => _Email_varificationState();
}

class _Email_varificationState extends State<Email_varification> {
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
        title: Text('Email Verification'),
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
            EBanner(),
            SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _textFieldOTP(first: true, last: false),
                                  _textFieldOTP(first: false, last: false),
                                  _textFieldOTP(first: false, last: false),
                                  _textFieldOTP(first: false, last: true),
                                ],
                              ),
                              SizedBox(
                                height: 22,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: MYVarifyButton(
                                    formkey: _formkey,
                                    emailController: _emailController,
                                    passController: _passController),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130.0),
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

  Widget _textFieldOTP({bool? first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xFF656FD7)),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
