import 'package:firebase_practice/ui/Auth/loginScreen.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post Screeen"),
      ),
      body: const Center(
        child: Text(
          "HEY YOU ARE LOGIN!!!",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            auth.signOut().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
              Utlis().thoastmessage("Logout Successfully");
            }).onError((error, stackTrace) {
              Utlis().thoastmessage("$error");
            });
          },
          child: const Icon(Icons.logout_sharp)),
    );
  }
}
