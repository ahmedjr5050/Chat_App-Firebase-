import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class Custom_textformfiel extends StatelessWidget {
  Custom_textformfiel({Key? key, required this.hinttext, this.onChanged, this.con,this.obsecure=false}) : super(key: key);
  String? hinttext;
  
  Function(String)? onChanged;
  TextEditingController? con;
  bool? obsecure=true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure!,
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
          hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          ))),
    );
  }
}
