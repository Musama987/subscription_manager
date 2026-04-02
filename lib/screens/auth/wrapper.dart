import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login/login.dart';
import '../navbar/navbar.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(color: Colors.blue)),
          );
        }

        if (snapshot.hasData) {
          return const PersistentNavbar();
        }

        return const LoginScreen();
      },
    );
  }
}
