import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  String title;
  final tap;
  final bool loading;
  RoundButton(
      {super.key,
      required this.title,
      required this.tap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: 50,
        width: 330,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(30)),
        alignment: Alignment.center,
        child: loading
            ? const CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.white,
              )
            : Text(
                title,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
      ),
    );
  }
}
