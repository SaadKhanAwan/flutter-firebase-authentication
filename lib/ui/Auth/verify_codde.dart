import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/ui/PostScreen.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../widgets/roundbutton.dart';
import '../../widgets/textfiled.dart';

class VerifyCode extends StatefulWidget {
  // this value come from previous page
  final String verficationId;
  const VerifyCode({super.key, required this.verficationId});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  bool isloading = false;
  var sMSnumbercontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("verify number"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          field(
            hint: "6 digit code",
            contrl: sMSnumbercontroller,
            type: TextInputType.number,
          ),
          const SizedBox(
            height: 50,
          ),
          RoundButton(
              title: "Verify",
              loading: isloading,
              tap: () async {
                setState(() {
                  isloading = true;
                });
                var credential = PhoneAuthProvider.credential(
                    verificationId: widget.verficationId,
                    smsCode: sMSnumbercontroller.text.toString());
                try {
                  await auth.signInWithCredential(credential);
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostScreen()));
                } catch (e) {
                  setState(() {
                    isloading = false;
                  });
                  Utlis().thoastmessage(e.toString());
                }
              })
        ],
      ),
    );
  }
}
