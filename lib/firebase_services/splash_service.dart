// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:campus_charcha/screens/home_screen.dart';
import 'package:campus_charcha/screens/onbording_screen.dart';
import 'package:campus_charcha/ui/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashServices {
  void islogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    await Future.delayed(const Duration(seconds: 3));

    if (!context.mounted) return;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false); 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  OnboardingScreen()),
      );
    } 
    else {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Homescreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    }
  }
}
