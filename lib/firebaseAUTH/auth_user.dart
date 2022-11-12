import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class userAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signUp(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User userSign = credential.user!;

      return userSign;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future signIn(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User userLog = user.user!;

      return userLog;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(e.code);
      } else if (e.code == 'Wrong Password ') {
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future signout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == true) {
        print("User is not signed in");
      } else if (e.code == false) {
        print("User is signed in");
      }
    }
  }
}
