import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/ui/Auth/verify_codde.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:firebase_practice/widgets/roundbutton.dart';
import 'package:firebase_practice/widgets/textfiled.dart';
import 'package:flutter/material.dart';

class LoginWithPhonenumber extends StatefulWidget {
  const LoginWithPhonenumber({super.key});

  @override
  State<LoginWithPhonenumber> createState() => _LoginWithPhonenumberState();
}

class _LoginWithPhonenumberState extends State<LoginWithPhonenumber> {
  // this is for login by phone number
  bool isloading = false;
  var phonenumbercontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("login by phone"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          field(
            hint: "+92 343985709",
            contrl: phonenumbercontroller,
            type: TextInputType.number,
          ),
          SizedBox(
            height: 50,
          ),
          RoundButton(
              title: "Login",
              loading: isloading,
              tap: () {
                setState(() {
                  isloading = true;
                });
                auth.verifyPhoneNumber(
                    phoneNumber: phonenumbercontroller.text.toString(),
                    verificationCompleted: (_) {
                      setState(() {
                        isloading = false;
                      });
                    },
                    verificationFailed: (e) {
                      setState(() {
                        isloading = false;
                      });
                      Utlis().thoastmessage(e.toString());
                    },
                    codeSent: (String verficationId, int? Token) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyCode(
                                    verficationId: verficationId,
                                  )));
                      setState(() {
                        isloading = false;
                      });
                    },
                    codeAutoRetrievalTimeout: (e) {
                      Utlis().thoastmessage(e.toString());
                      setState(() {
                        isloading = false;
                      });
                    });
              })
        ],
      ),
    );
  }
}
