import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  const CustomTextForm({super.key, required this.hintText, required this.myController,required this.validator});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator:validator ,
      controller: myController,
        decoration: InputDecoration(
          hintText: "Enter your email ",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 184, 184, 184),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
                color: const Color.fromARGB(255, 153, 151, 151)),
          ),
        ));
  }
}
