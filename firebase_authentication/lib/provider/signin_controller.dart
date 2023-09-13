import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/main.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInAuth extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  void emailLogin() {
    _signInWithEmail(emailAddress.text.trim(), password.text.trim());
    emailAddress.clear();
    password.clear();
  }

  void logout() async {
    await _auth.signOut();
    Get.offAll(() => const MyHomePage());
    Get.rawSnackbar(message: 'Logged out Sucessfully');
  }

  Future<void> _signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => const MyHomePage());
      Get.rawSnackbar(message: 'Logged in Sucessfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.rawSnackbar(message: 'No user found for that email.');
      } else if (e.code == 'invalid-email') {
        Get.rawSnackbar(message: 'Wrong email provided for that user.');
      } else if (e.code == 'wrong-password') {
        Get.rawSnackbar(message: 'Wrong password provided for that user.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:
            '226438241533-45d1a9rkmihcvgjf3d9ol9c04h54669u.apps.googleusercontent.com');

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      await _auth.signInWithPopup(authProvider);
      Get.offAll(() => const MyHomePage());
      Get.rawSnackbar(message: 'Logged in via Google');
    } else {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      await _auth.signInWithCredential(credential);
      Get.offAll(() => const MyHomePage());
      Get.rawSnackbar(message: 'Logged in via Google');
    }
  }
}
