import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:travel_app/firebaseAUTH/auth_user.dart';
import 'package:travel_app/user/home_user.dart';
import 'package:travel_app/user/register.dart';

class UserSign extends StatefulWidget {
  const UserSign({Key? key}) : super(key: key);

  @override
  State<UserSign> createState() => _UserSignState();
}

class clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clip = Path();

    clip.lineTo(0, size.height);
    clip.quadraticBezierTo(
        size.width / 2, size.height * 0.75, size.width, size.height);
    clip.lineTo(size.width, 0);
    clip.close();

    return clip;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _UserSignState extends State<UserSign> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 5),
                child: ClipPath(
                    clipper: clipper(),
                    child: Image(
                        width: MediaQuery.of(context).size.width * 2,
                        fit: BoxFit.cover,
                        image: const AssetImage('assets/images/hotelio1.png'))),
              ),
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0, right: 220),
                        child: Text.rich(
                          TextSpan(
                              text: " Hello \n",
                              style: GoogleFonts.allison(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Welcome Back',
                                    style: GoogleFonts.allison(
                                        color: Colors.black,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: TextFormField(
                        validator: validEmail,
                        controller: emailController,
                        decoration: InputDecoration(
                            focusColor: Colors.purple,
                            hoverColor: Colors.purple,
                            fillColor: Colors.purple,
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 25),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    
                   
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () async {
                                  
                                  final user = await userAuth.signIn(
                                      emailController.text,
                                      passwordController.text);
                                  if (user != null) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacement(context, PageAnimationTransition(page: const HomeUser(), pageAnimationType: LeftToRightFadedTransition()));
                                  }else if (user == null){
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Error"),
                                            content: const Text("Invalid Email or Password"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("OK"))
                                            ],
                                          );
                                        });
                                  }
                                  if (_key.currentState!.validate()) {
                                    await userAuth.signIn(emailController.text,
                                        passwordController.text);
                                     
                                        // ignore: use_build_context_synchronously
                                        
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: 
                                      const Color.fromARGB(255, 7, 75, 114),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                child: const Icon(Icons.arrow_circle_right)),
                          ),
                        ],
                      ),
                    
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    PageAnimationTransition(
                                        page: RegisterUser(),
                                        pageAnimationType:
                                            FadeAnimationTransition()));
                              },
                              child: Text(
                                ' Dont have a account ?',
                                style: GoogleFonts.badScript(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )),

                              
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

String? validEmail(String? form) {
  if (form == null || form.isEmpty) {
    
    return 'Please enter your email';
  }
  return null;
}

