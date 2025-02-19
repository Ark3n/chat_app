import 'package:chat_app/services/auth/auth_service.dart';
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
  void register(BuildContext context) async {
    // get auth service
    final auth = AuthService();

    // if password match -> create a user
    if (_passwordController.text == _confirmPwController.text) {
      try {
        await auth.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Password don't match"),
              ));
    }
  }

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
            MyButton(title: 'Register now', onTap: () => register(context)),
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
