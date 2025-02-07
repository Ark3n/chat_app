import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // methods
  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),

            // welcome message
            Text(
              'Let\'s create an account for you! ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 25),

            // email text field
            MyTextField(
                hintText: 'Email',
                obscureText: false,
                controller: _emailController),
            const SizedBox(height: 10),

            // pw text field
            MyTextField(
                hintText: 'Password',
                obscureText: true,
                controller: _pwController),
            const SizedBox(height: 10),

            // confirm pw text field
            MyTextField(
                hintText: 'Confirm password',
                obscureText: true,
                controller: _confirmPwController),
            const SizedBox(height: 25),

            // register button
            MyButton(title: 'register now', onTap: register),
            const SizedBox(height: 10),

            // login now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'login now',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
