import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/Pages/chat_page..dart';
import 'package:scholar_chat/constants.dart';
import '../helper/snakebarMasseage.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_textfields.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';

  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 75,
                ),
                Image.asset('assets/images/scholar.png'),
                const Text(
                  'Scholar Chat',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'pacifico'),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text(
                        'Register',
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
                        onChanged: (data) {
                          email = data;
                        },
                        hinttext: 'Email',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Custom_textformfiel(
                          onChanged: (data) {
                            password = data;
                          },
                          hinttext: 'Password'),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButtom(
                        name: 'Register',
                        onTabe: () async {
                          if (formkey.currentState!.validate()) {
                            isLoading = true;

                            setState(() {});
                            try {
                              await registerUser();
                              Navigator.pushNamed(context, ChatPage.id);
                              snakebarMasseage(context, 'sucess');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                snakebarMasseage(context, 'weak password');
                              } else if (e.code == 'email-already-in-use') {
                                snakebarMasseage(context,
                                    'the account already exist for that email');
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
                            'have an account ?',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              '   Login',
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
      ),
    );
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
