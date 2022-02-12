import 'package:bangkit/auth/login.dart';
import 'package:bangkit/constants/controller_constants.dart';
import 'package:bangkit/controllers/auth_controller.dart';
import 'package:bangkit/controllers/getxcontrollers.dart';
import 'package:bangkit/controllers/location_controller.dart';
import 'package:bangkit/controllers/page_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/verify_email.dart';
import '../models/profile.dart';
import '../profile/profileregistration.dart';
import 'bottom_route.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authController.auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            var user = snapshot.data;
            if (user!.emailVerified) {
              return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: Profile.getUserProfileAsStream(authController.auth.currentUser!.uid),
                builder: (BuildContext context, AsyncSnapshot profileSnapshot) {
                  if (profileSnapshot.connectionState == ConnectionState.active) {
                    if (profileSnapshot.hasData & profileSnapshot.data.exists) {
                      Get.put(ProfileController());
                      var profile = Profile.fromJson(profileSnapshot.data!.data());
                      profileController.profile = profile;
                      profile.generateToken();

                      return BottomRouter();
                    } else {
                      return const Registration();
                    }
                  } else {
                    return const Scaffold(body: Center(child: CircularProgressIndicator()));
                  }
                },
              );
            } else {
              return const VerifyEmail();
            }
          } else {
            return const SignInWidget();
          }
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
