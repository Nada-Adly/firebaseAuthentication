import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      textColor: Colors.white,
      color: Color.fromARGB(255, 242, 174, 27),
      onPressed: onPressed,
      child: Text(title),

    );
  }
}
