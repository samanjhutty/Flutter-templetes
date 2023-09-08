import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/auth/screens/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpAuth extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  String shadowedPhone = 'XXXXXXXXXX';
  String countryCode = '+91';
  String phoneOTP = '';
  String verifyID = '';

  User? user = FirebaseAuth.instance.currentUser;

  void createAccount() => _signUpWithEmail(emailAddress.text, password.text);
  void logout() async => await _auth.signOut();

  void mobileSignIn() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: countryCode + phone.text,
        timeout: const Duration(minutes: 10),
        verificationCompleted: (PhoneAuthCredential authCredential) =>
            phone.clear(),
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            Get.rawSnackbar(message: 'The provided phone number is not valid');
          } else if (e.code == 'invalid-verification-code') {
            Get.rawSnackbar(message: 'Invalid code');
          }
        },
        codeSent: (String verificationID, int? resendCode) {
          Get.to(() => const Material(child: OTPPage()));
          verifyID = verificationID;
          String numberOBS = phone.text.substring(6);
          shadowedPhone = 'XXXXXX$numberOBS';
          Get.rawSnackbar(
              message:
                  'OTP has been sent to your mobile number $shadowedPhone');
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  void verifyMobile() async {
    try {
      PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: verifyID, smsCode: phoneOTP);
      await _auth.signInWithCredential(authCredential);
      Get.until((route) => route.isFirst);
      Get.rawSnackbar(message: 'OTP verified');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        Get.rawSnackbar(message: 'Invalid code');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _signUpWithEmail(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      Get.rawSnackbar(message: 'Account created sucessfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.rawSnackbar(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.rawSnackbar(message: 'The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
