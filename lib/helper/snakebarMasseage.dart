// ignore: file_names
import 'package:flutter/material.dart';

void snakebarMasseage(BuildContext context, String massage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(massage),
    ));
  }
