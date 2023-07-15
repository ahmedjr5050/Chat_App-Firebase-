import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';

import '../widgets/chatbubble.dart';

class chatPage extends StatelessWidget {
  static String id = 'Chat_Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaycolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kicon,
              height: 50,
            ),
            Text('Chat'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Chatbubble();
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.send,
                    color: kPrimaycolor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: kPrimaycolor),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
