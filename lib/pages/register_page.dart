import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  // MARK: - Methods
  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // icon
            Icon(
              Icons.message,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),

            // Welcome Message
            Text(
              'Let\'s create an account for you!',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            const SizedBox(height: 10),

            // email text filed
            MyTextField(
                hintText: 'Email',
                obscureText: false,
                controller: _emailController),
            const SizedBox(height: 10),

            // password text field
            MyTextField(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController),
            const SizedBox(height: 10),

            // confirm password text field
            MyTextField(
                hintText: 'Confirm password',
                obscureText: true,
                controller: _confirmPwController),
            const SizedBox(height: 10),

            // register button
            MyButton(title: 'Register now', onTap: register),
            const SizedBox(height: 10),

            // Already have an account? Login
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
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
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
