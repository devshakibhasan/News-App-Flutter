import 'package:flutter/material.dart';

class Email_feild extends StatelessWidget {
  const Email_feild({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      validator: (val) =>
          val!.isNotEmpty ? null : "Please enter a email address",
      // validator: (val) =>
      //     val!.isNotEmpty ? null : "plesase enter a email addrees",
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Colors.red,
        prefixIcon: Icon(
          Icons.email,
        ),
        hintText: 'Enter your Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }
}
