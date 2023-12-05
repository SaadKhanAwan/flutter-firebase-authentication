// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/ui/Auth/login_with_phone.dart';
import 'package:firebase_practice/ui/Auth/signup.dart';
import 'package:firebase_practice/ui/PostScreen.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../widgets/roundbutton.dart';
import '../../widgets/textfiled.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isloading = false;
  final _formkey = GlobalKey<FormState>();
  var logincontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    logincontroller.dispose();
    passwordcontroller.dispose();
  }

  final _auth = FirebaseAuth.instance;

  void login() {
    setState(() {
      isloading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: logincontroller.text.toString(),
            password: passwordcontroller.text.toString())
        .then((value) {
      Utlis().thoastmessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PostScreen()));
      setState(() {
        isloading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utlis().thoastmessage(error.toString());
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // this willpopScope is use to back to exsit not back to splash screen
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Login Screen",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              field(
                type: TextInputType.emailAddress,
                hint: "Enter user name",
                contrl: logincontroller,
                message: (value) {
                  if (value!.isEmpty) {
                    return "please enter email";
                  }
                  return null;
                },
              ),
              field(
                hint: "Enter  password",
                contrl: passwordcontroller,
                type: TextInputType.number,
                message: (value) {
                  if (value!.isEmpty) {
                    return "please enter email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              RoundButton(
                loading: isloading,
                title: "login",
                tap: () {
                  if (_formkey.currentState!.validate()) {
                    login();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text("dont have an account?"),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundButton(
                title: "Sign up",
                tap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const signup()));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginWithPhonenumber()));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "login with phone",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
