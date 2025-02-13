import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.secondary,
              filled: true,
              hintText: hintText,
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary)))),
    );
  }
}
