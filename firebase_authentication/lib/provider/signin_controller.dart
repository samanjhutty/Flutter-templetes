import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInAuth with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? _user = FirebaseAuth.instance.currentUser;
  User? get user => _user;

  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  void emailLogin() =>
      _signInWithEmail(emailAddress.text.trim(), password.text.trim())
          .whenComplete(() {
        emailAddress.clear();
        password.clear();
      });

  void logout() async {
    await _auth.signOut();
    notifyListeners();
    Get.rawSnackbar(message: 'Logged out Sucessfully');
  }

  void deleteUser() async {
    await _user!.delete();
    notifyListeners();
  }

  Future<void> _signInWithEmail(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        Get.rawSnackbar(message: 'Logged in Sucessfully');
        notifyListeners();
        Get.until((route) => route.isCurrent);
      });
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
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
          clientId:
              '226438241533-45d1a9rkmihcvgjf3d9ol9c04h54669u.apps.googleusercontent.com');

      if (kIsWeb) {
        GoogleAuthProvider authProvider = GoogleAuthProvider();
        await _auth.signInWithPopup(authProvider);
        notifyListeners();
      } else {
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

        await _auth.signInWithCredential(credential);
        notifyListeners();
      }
      Get.back();
      Get.rawSnackbar(message: 'Logged in via Google');
    } on FirebaseAuthException {
      Get.back();
      Get.rawSnackbar(message: 'Something went Wrong, try again!');
    }
  }
}
