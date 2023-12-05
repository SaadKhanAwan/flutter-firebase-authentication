import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/ui/Auth/loginScreen.dart';
import 'package:firebase_practice/ui/PostScreen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      // if login go to it
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PostScreen()));
      });
    } else {
      // if not login go to it
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }
}
