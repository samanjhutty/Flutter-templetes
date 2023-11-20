import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/auth/pages/update_profile.dart';
import 'package:firebase_authentication/auth/pages/otp_page.dart';
import 'package:firebase_authentication/provider/profileimage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpAuth extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ProfileController profile = Get.put(ProfileController());

  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String shadowedPhone = 'XXXXXXXXXX';
  final String countryCode = '+91';
  String phoneOTP = '';
  String verifyID = '';

  void createAccount() {
    _signUpWithEmail(emailAddress.text.trim(), password.text.trim(),
            confirmPassword.text.trim())
        .whenComplete(() {
      emailAddress.clear();
      password.clear();
      username.clear();
      confirmPassword.clear();
    });
  }

  void logout() async {
    await _auth.signOut();
    notifyListeners();
    Get.rawSnackbar(message: 'Logged out Sucessfully');
  }

  void mobileSignIn() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: countryCode + phone.text,
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
      await _auth.signInWithCredential(authCredential).whenComplete(() {
        notifyListeners();
        Get.rawSnackbar(message: 'OTP verified');

        _auth.currentUser!.displayName == null
            ? Get.toNamed('/profie')
            : Get.until((route) => route.isFirst);
      });
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
          ? await _auth
              .createUserWithEmailAndPassword(
                  email: emailAddress, password: cPassword)
              .whenComplete(() async {
              Get.rawSnackbar(message: 'Account created sucessfully');
              await profile.updateProfile();
              notifyListeners();
              Get.until((route) => route.isCurrent);
            })
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
