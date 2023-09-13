import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/auth/pages/update_profile.dart';
import 'package:firebase_authentication/auth/pages/otp_page.dart';
import 'package:firebase_authentication/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpAuth extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String shadowedPhone = 'XXXXXXXXXX';
  String countryCode = '+91';
  String phoneOTP = '';
  String verifyID = '';

  void createAccount() {
    _signUpWithEmail(emailAddress.text.trim(), password.text.trim(),
        confirmPassword.text.trim());
    _auth.currentUser!.updateDisplayName(username.text.trim());
    emailAddress.clear();
    password.clear();
    username.clear();
  }

  void logout() async => await _auth.signOut();

  void mobileSignIn() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: countryCode + phone.text,
        timeout: const Duration(minutes: 10),
        verificationCompleted: (PhoneAuthCredential authCredential) {
          phone.clear();
          username.clear();
        },
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
      Future.delayed(const Duration(seconds: 2)).then((value) {
        if (_auth.currentUser!.displayName == null) {
          Get.to(() => const Material(child: UpdateProfile()));
        } else {
          Get.offAll(() => const MyHomePage());
        }
      });

      Get.rawSnackbar(message: 'OTP verified');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        Get.rawSnackbar(message: 'Invalid code');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _signUpWithEmail(
      String emailAddress, String password, String cPassword) async {
    try {
      cPassword == password
          ? {
              await _auth.createUserWithEmailAndPassword(
                  email: emailAddress, password: cPassword),
              Get.rawSnackbar(message: 'Account created sucessfully'),
              _auth.currentUser!.updateDisplayName(username.text),
              Future.delayed(const Duration(seconds: 2))
                  .then((value) => Get.offAll(() => const MyHomePage())),
            }
          : Get.rawSnackbar(message: "Password doesn't match");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.rawSnackbar(message: 'The password provided is too weak.');
      } else if (e.code == 'invalid-email') {
        Get.rawSnackbar(message: 'Enter valid email address.');
      } else if (e.code == 'email-already-in-use') {
        Get.rawSnackbar(message: 'The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
