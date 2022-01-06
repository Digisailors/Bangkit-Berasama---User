import 'package:bangkit/constants/controller_constants.dart';

import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Email Not Verfied",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  "Your email has not been Verified. An email verification link has been sent to your email, Kindly click on the link to verify."),
            ),
            const Text("Didn't receive an email ? "),
            const Text("or "),
            const Text("Link expired ?"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    authController.auth.currentUser!.sendEmailVerification().then((value) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(content: const Text("A mail has been sent"), actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("OKay"))
                            ]);
                          });
                    });
                  },
                  child: const Text("Send Verification email")),
            ),
            ElevatedButton(
              onPressed: () {
                authController.auth.signOut();
              },
              child: const Text("Logout"),
            ),
            ElevatedButton(
              onPressed: () {
                authController.auth.currentUser!.reload();
                Navigator.of(context).popAndPushNamed('/');
              },
              child: const Text("Check again"),
            ),
          ],
        ),
      ),
    );
  }
}
