// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print


import 'package:flutter/material.dart';
import 'package:news_app/src/views/home/home_page.dart';

class SignUp_Button extends StatelessWidget {
  const SignUp_Button({
    Key? key,
    required GlobalKey<FormState> formkey,
    required TextEditingController emailController,
    required TextEditingController passController,
    required TextEditingController nameController,
  })  : _formkey = formkey,
        _emailController = emailController,
        _passController = passController,
        _nameController = nameController,
        super(key: key);

  final GlobalKey<FormState> _formkey;
  final TextEditingController _emailController;
  final TextEditingController _passController;
  final TextEditingController _nameController;

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
          gradient: LinearGradient(
            colors: [
              Color(0xff555FD2),
              Color(0xff555FD2),
            ],
          ),
        ),
        padding: const EdgeInsets.all(0),
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          print("Email: ${_nameController.text}");
          print("Email: ${_emailController.text}");
          print("password: ${_passController.text}");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        }
      },
    );
  }
}
