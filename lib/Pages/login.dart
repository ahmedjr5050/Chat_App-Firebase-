import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/Pages/chat_page..dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/widgets/custom_buttom.dart';

import '../helper/snakebarMasseage.dart';
import '../widgets/custom_textfields.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  static String id = 'LoginPage';

  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/scholar.png'),
              const Text(
                'Scholar Chat',
                style: TextStyle(
                    color: Colors.white, fontSize: 32, fontFamily: 'pacifico'),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Custom_textformfiel(
                      hinttext: 'Email',
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Custom_textformfiel(
                      obsecure: true,
                      hinttext: 'Password',
                      onChanged: (data) {
                        password = data;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButtom(
                      name: 'LOGIN',
                      onTabe: () async {
                        if (formkey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await registerUser();
                            snakebarMasseage(context, 'sucess');
                            Navigator.pushNamed(context, ChatPage.id,
                                arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              snakebarMasseage(
                                  context, 'No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              snakebarMasseage(context,
                                  'Wrong password provided for that user.');
                            }
                          } catch (ex) {
                            snakebarMasseage(context, 'there was an error');
                          }
                          isLoading = false;
                          setState(() {});
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'dont \'t have an account ?',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'RegisterPage');
                          },
                          child: const Text(
                            '   Register',
                            style: TextStyle(color: Color(0xffc3e7e7)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email: email!, password: password!);
  }
}
