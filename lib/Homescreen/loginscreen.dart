import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/top_to_bottom_faded.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/user/user_sign.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controlPage = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
          body: SafeArea(
            
              child: Column(
        children: [
          SizedBox(
            height: 700,
            child: PageView(
              controller: _controlPage,
              children: [
                page1(),
                page2(),
                page3(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controlPage,
            count: 3,
            axisDirection: Axis.horizontal,
            effect: const JumpingDotEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.cyan,
                spacing: 30,
                verticalOffset: 25),
          )
        ],
      ))),
    );
  }
}

page1() {
  return Scaffold(
    backgroundColor: Colors.white,
      body: Stack(
    children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/man.gif'), fit: BoxFit.contain),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(130, 0, 0, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text.rich(
              TextSpan(
                  text: 'THE BEST APP \n',
                  style: GoogleFonts.aleo(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' FOR YOUR ',
                        style: GoogleFonts.aleo(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 10)),
                    TextSpan(
                        text: ' JOURNEY ',
                        style: GoogleFonts.aleo(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.normal,
                            fontSize: 15))
                  ]),
            )
          ],
        ),
      )
    ],
  ));
}

page2() {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Container(
        decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/man.gif'), fit: BoxFit.contain),
    )),
  );
}

page3() {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/man.gif'), fit: BoxFit.contain),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(160, 0, 0, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fixedSize: Size(50, 50),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page: UserSign(),
                        pageAnimationType: TopToBottomFadedTransition()));
                  },
                  child: Icon(Icons.arrow_circle_right,
                      color: Color.fromARGB(255, 255, 255, 255)));
            })
          ],
        ),
      ),
    ]),
  );
}
