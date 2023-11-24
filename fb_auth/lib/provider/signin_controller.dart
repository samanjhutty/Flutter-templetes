import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInAuth with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  void emailLogin() =>
      _signInWithEmail(emailAddress.text.trim(), password.text.trim())
          .whenComplete(() {
        emailAddress.clear();
        password.clear();
      });

  void logout() async {
    await auth.signOut();
    notifyListeners();
    Get.rawSnackbar(message: 'Logged out Sucessfully');
  }

  void deleteUser() async {
    await auth.currentUser!.delete();
    notifyListeners();
    Get.rawSnackbar(message: 'Account deleted Sucessfully');
  }

  Future<void> _signInWithEmail(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      Get.rawSnackbar(message: 'Logged in Sucessfully');
      notifyListeners();
      Get.until(ModalRoute.withName('/'));
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
        await auth.signInWithPopup(authProvider);
        notifyListeners();
      } else {
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

        await auth.signInWithCredential(credential);
        notifyListeners();
      }
      Get.back();
      Get.rawSnackbar(message: 'Logged in via Google');
    } on FirebaseAuthException {
      Get.back();
      Get.rawSnackbar(message: 'Something went Wrong, try again!');
    }
  }

  reauth() async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
          email: auth.currentUser!.email!, password: password.text);
      await auth.currentUser!.reauthenticateWithCredential(credential);
      await auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        Get.rawSnackbar(message: 'Wrong Password');
      } else if (e.code == 'invalid-credential') {
        Get.rawSnackbar(message: 'Wrong Credentials');
      }
    }
    notifyListeners();
  }

  defaultSubmitBtn({String title = 'Next'}) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(title),
        const SizedBox(width: 8),
        const Icon(Icons.arrow_forward_rounded)
      ]);

  myAnimation({String title = 'Next', bool progress = false}) {
    Widget btn = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(title),
      const SizedBox(width: 8),
      progress == false
          ? const Icon(Icons.arrow_forward_rounded)
          : const SizedBox(
              height: 24, width: 24, child: CircularProgressIndicator())
    ]);
    notifyListeners();
    return btn;
  }
}
