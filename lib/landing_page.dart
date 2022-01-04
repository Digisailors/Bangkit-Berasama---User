import 'package:bangkit/auth/login.dart';
import 'package:bangkit/constants/controller_constants.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authController.auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Container(color: Colors.green);
          } else {
            return const SignInWidget();
          }
        }
        return Container(color: Colors.yellow);
      },
    );
  }
}
