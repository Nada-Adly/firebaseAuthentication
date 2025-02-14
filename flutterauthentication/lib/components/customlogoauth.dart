import 'package:flutter/material.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(70)),
        child: Image.asset(
          "assets/logo.png",
          width: 50,
          height: 50,
          //fit: BoxFit.fill, // fit take full width
        ),
      ),
    );
  }
}
