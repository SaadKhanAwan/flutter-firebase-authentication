import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:firebase_practice/widgets/roundbutton.dart';
import 'package:firebase_practice/widgets/textfiled.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class update extends StatefulWidget {
  // this is from privious screen
  final String title;
  final String id;

  const update({super.key, required this.title, required this.id});

  @override
  State<update> createState() => _updateState();
}

// ignore: camel_case_types
class _updateState extends State<update> {
  final ref = FirebaseDatabase.instance.ref('post');
  final updateit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //this for text field to data which is already there
    updateit.text = widget.title;
    return Scaffold(
      appBar: AppBar(
        title: const Text("update data"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          field(contrl: updateit, hint: "update it"),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: RoundButton(
                title: "update",
                tap: () {
                  // here we update id which is time we have give it
                  ref.child(widget.id).update(
                      {'title': updateit.text.toString()}).then((value) {
                    Navigator.pop(context);
                    Utlis().thoastmessage("post updated");
                  }).onError((error, stackTrace) {
                    Utlis().thoastmessage(error.toString());
                  });
                }),
          )
        ],
      )),
    );
  }
}
