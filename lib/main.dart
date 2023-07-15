import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/Pages/chat_page..dart';
import 'package:scholar_chat/Pages/login.dart';
import 'package:scholar_chat/Pages/register.dart';

import 'firebase_options.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LoginPage(),
      routes: {
        LoginPage.id:(context) =>  LoginPage(),
        RegisterPage.id:(context) =>  RegisterPage(),
        chatPage.id:(context)=>chatPage(),
      },
      initialRoute: chatPage.id,
    );
  }
}
