import 'package:flutter/material.dart';

class field extends StatelessWidget {
  final String hint;
  final TextEditingController? contrl;
  final Icon? icoon;
  final type;
  final message;
  final lines;
  final onchange;
  final initial;
  field(
      {required this.hint,
      this.icoon,
      this.contrl,
      this.type,
      this.message,
      this.lines,
      this.onchange,
      this.initial});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
          initialValue: initial,
          validator: message,
          maxLines: lines,
          keyboardType: type,
          controller: contrl,
          onChanged: onchange,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: icoon,
            filled: true,
            fillColor: Colors.grey,
            hintStyle: const TextStyle(color: Colors.white70),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          )),
    );
  }
}
