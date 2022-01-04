import 'package:bangkit/auth/login.dart';
import 'package:bangkit/constants/controller_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authController.auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var user = snapshot.data;
            if (user!.emailVerified) {
            } else {}
          } else {
            return const SignInWidget();
          }
        }
        return Container(color: Colors.yellow);
      },
    );
  }
}
