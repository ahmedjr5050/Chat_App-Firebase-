import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

// ignore: camel_case_types
class Chatbubble extends StatelessWidget {
  const Chatbubble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding:
            const EdgeInsets.only(left: 16, top: 32, right: 32, bottom: 32),
        child: const Text(
          'i am a new user',
          style: TextStyle(color: Colors.white),
        ),
        decoration: const BoxDecoration(
            color: kPrimaycolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            )),
      ),
    );
  }
}
