import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInAuth extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  void emailLogin() => _signInWithEmail(emailAddress.text, password.text);

  void logout() async => await _auth.signOut();

  Future<void> _signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.rawSnackbar(message: 'Logged in Sucessfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.rawSnackbar(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.rawSnackbar(message: 'Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
