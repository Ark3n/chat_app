import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const MyButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
