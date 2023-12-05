import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/utils/utils.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_practice/ui/Auth/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/roundbutton.dart';
import '../../widgets/textfiled.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool isloading = false;
  var _formkey = GlobalKey<FormState>();
  var firstnamecontroller = TextEditingController();
  var Lastnamecontroller = TextEditingController();
  var Singupcontroller = TextEditingController();
  var passwordsingnupcontroller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  void login() {
    setState(() {
      isloading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: Singupcontroller.text.toString(),
            password: passwordsingnupcontroller.text.toString())
        .then((value) {
      setState(() {
        isloading = false;
      });
    }).onError((error, stackTrace) {
      Utlis().thoastmessage(error.toString());
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //this is for back arrow
        automaticallyImplyLeading: true,
        title: Text(
          "Sign up Screen",
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
              SizedBox(
                height: 100,
              ),
              field(
                type: TextInputType.emailAddress,
                hint: "Enter user name",
                contrl: Singupcontroller,
                message: (value) {
                  if (value!.isEmpty) {
                    return "please enter email";
                  }
                  return null;
                },
              ),
              field(
                hint: "Enter  password",
                contrl: passwordsingnupcontroller,
                type: TextInputType.number,
                message: (value) {
                  if (value!.isEmpty) {
                    return "please enter email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 50,
              ),
              RoundButton(
                title: "Sign up",
                loading: isloading,
                tap: () {
                  if (_formkey.currentState!.validate()) {
                    login();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _formkey {}
