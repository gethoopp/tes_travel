import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import 'user_sign.dart';
import '../firebaseAUTH/auth_user.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Form(
            key: _key,
            child: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  ClipPath(
                      clipper: clipper(),
                      child: Image(
                          width: MediaQuery.of(context).size.width * 2,
                          fit: BoxFit.cover,
                          image:
                              const AssetImage('assets/images/hotelio2.png'))),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: SizedBox(
                              width: 250,
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    hintText: 'Name',
                                    labelText: 'Name',
                                    labelStyle: const TextStyle(
                                        color: Color.fromARGB(255, 8, 43, 102)),
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: emailController,
                              validator: validateEmail,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  labelText: 'Email',
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: passwordController,
                              validator: validatePass,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  await userAuth.signUp(emailController.text,
                                      passwordController.text);

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Success"),
                                            content: const Text(
                                                "You have successfully registered"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      PageAnimationTransition(
                                                          pageAnimationType:
                                                              BottomToTopFadedTransition(),
                                                          page: const UserSign()));
                                                              
                                                },
                                                child: const Text("OK"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                            

                              };
                              },
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Color.fromARGB(255, 23, 66, 141),
                                  backgroundColor: Color.fromARGB(255, 20, 39, 54),
                                  fixedSize: Size(60, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: const Icon(Icons.login),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ])),
          ),
        ));
  }
}

String? validateEmail(String? emailForm) {
  if (emailForm == null || emailForm.isEmpty) return 'Email Dibutuhkan';

  return null;
}

String? validatePass(String? passForm) {
  if (passForm == null || passForm.isEmpty) return 'Password Dibutuhkan!';

  return null;
}
