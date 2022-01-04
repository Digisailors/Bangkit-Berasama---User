import 'dart:ui';

import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/widgets/widgets.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../landing_page.dart';

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
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/WhatsApp Image 2022-01-04 at 1.43.34 PM.jpeg'), fit: BoxFit.fill),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 90, 0, 80),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 180,
                          child: Image.asset(
                            'assets/logo option square transparent (1).png',
                            fit: BoxFit.cover,
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
                          onPressed: () {
                            authController.auth.signInWithEmailAndPassword(emailController.text, passwordController.text).then((value) {
                              print(value!.emailVerified);
                              Get.to(() => const LandingPage());
                            });
                          },
                          child: const Text('Login')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Or continue with',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
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
                          onPressed: () {
                            Get.to(const LandingPage());
                          },
                          child: const Text('Mobile Number')),
                    ),
                  ),
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
                          onPressed: () {},
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
    );
  }
}
