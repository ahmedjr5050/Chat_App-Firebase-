import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Custom_textformfiel extends StatelessWidget {
  Custom_textformfiel({required this.hinttext, this.onChanged, this.con});
  String? hinttext;
  Function(String)? onChanged;
  TextEditingController? con;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: con,
      // ignore: body_might_complete_normally_nullable
      validator: (data) {
        if (data!.isEmpty) {
          return 'value is wrong';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          ))),
    );
  }
}
