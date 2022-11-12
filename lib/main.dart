import 'package:flutter/material.dart';
import 'package:travel_app/Homescreen/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel_app/user/home_user.dart';
//import 'package:travel_app/user/Home.dart';
import 'firebaseAUTH/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LoginScreen());
}


