import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  CustomButtom({required this.name,this.onTabe});
  String name;
  VoidCallback? onTabe;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTabe ,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          
        ),
      ),
    );
  }
}
