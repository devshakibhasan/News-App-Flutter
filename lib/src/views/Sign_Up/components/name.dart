import 'package:flutter/material.dart';

class Name_feild extends StatelessWidget {
  const Name_feild({
    Key? key,
    required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      validator: (val) =>
          val!.isNotEmpty ? null : "Please enter your name",
      // validator: (val) =>
      //     val!.isNotEmpty ? null : "plesase enter a email addrees",
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Colors.red,
        prefixIcon: Icon(
          Icons.person,
        ),
        hintText: 'Enter your Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }
}
