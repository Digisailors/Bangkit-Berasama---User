import 'dart:ui';

import 'package:bangkit/auth/forgot_password.dart';
import 'package:bangkit/auth/signup.dart';
import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  AuthProvider authType = AuthProvider.email;
  bool obscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      // backgroundColor: Colors.redAccent.withOpacity(0.9),
      body: SingleChildScrollView(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'assets/bina.png',
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              hintText: 'Enter your email',
                              labelText: 'Email',
                              controller: emailController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: passwordController,
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              obscureText: obscureText,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                child: obscureText
                                    ? const Icon(
                                        Icons.visibility_off_outlined,
                                        color: Colors.black,
                                        size: 22,
                                      )
                                    : const Icon(
                                        Icons.visibility_outlined,
                                        color: Colors.black,
                                        size: 22,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width * 0.12,
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(10),
                              shadowColor: MaterialStateProperty.all(Colors.redAccent),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                            ),
                            onPressed: () async {
                              String title = '', message = '';
                              if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                                title = "Empty Email or Password";
                                message = "Please fill-out both email and password";
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(title),
                                        content: Text(message),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Okay")),
                                        ],
                                      );
                                    });
                              } else if (!emailController.text.removeAllWhitespace.isEmail) {
                                title = "Invalid Email";
                                message = "Please enter a valid email";
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(title),
                                        content: Text(message),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Okay")),
                                        ],
                                      );
                                    });
                              } else {
                                await authController.auth.signInWithEmailAndPassword(emailController.text, passwordController.text).then((value) {
                                  Navigator.of(context).popAndPushNamed('/');
                                }).catchError((error) {
                                  title = error.code ?? "Error";
                                  message = error.message ?? "Unknown Error";
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(title),
                                          content: Text(message),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Okay")),
                                          ],
                                        );
                                      });
                                });
                              }
                            },
                            child: const Text('Login')),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // ignore: avoid_print
                        // print("Pressed");
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return ForgotPassword(
                                email: emailController.text,
                              );
                            });
                      },
                      child: const Text(
                        'Forgot Password ?',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    // const Text("OR"),
                    // TextButton(
                    //   onPressed: () {
                    //     // ignore: avoid_print
                    //     // print("Pressed");
                    //   },
                    //   child: const Text(
                    //     'Log in with OTP ',
                    //     style: TextStyle(
                    //       fontFamily: 'Lexend Deca',
                    //       color: Colors.blue,
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.normal,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not a member ?',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return SignUpWidget(
                                      email: emailController.text,
                                    );
                                  });
                            },
                            child: const Text(
                              'Register Now',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
