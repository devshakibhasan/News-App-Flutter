// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print
import 'package:flutter/material.dart';

class RestButton extends StatelessWidget {
  const RestButton({
    Key? key,
    required GlobalKey<FormState> formkey,

    required TextEditingController passController,
  })  : _formkey = formkey,
  
        _passController = passController,
        super(key: key);

  final GlobalKey<FormState> _formkey;

  final TextEditingController _passController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            // ignore: prefer_const_literals_to_create_immutables
            gradient: LinearGradient(colors: [
              Color(0xff555FD2),
              Color(0xff555FD2),
            ])),
        padding: const EdgeInsets.all(0),
        child: Text(
          "Log in",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      onPressed: () {
        if (_formkey.currentState!.validate()) {
     
          print("password: ${_passController.text}");
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => SignUp_Page()));
        }
      },
    );
  }
}
