import 'package:chat_app/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user logged in
        if (snapshot.hasData) {
          return HomePage();
        }

        // user is not logged in
        else {
          return LoginOrRegister();
        }
      },
    );
  }
}
