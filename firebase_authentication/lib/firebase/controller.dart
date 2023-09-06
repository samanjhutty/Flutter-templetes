import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/auth/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseAuthentication extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController mobileController = TextEditingController();
  String shadowedMobile = 'XXXXXX';
  String countryCode = '+91';
  String otp = '';
  String verifyID = '';

  // RxString userMobileNumber = ''.obs;

  User? user = FirebaseAuth.instance.currentUser;

  //void getUser() =>
  //   userMobileNumber.value = user != null ? user!.phoneNumber.toString() : '';

  void logout() async => await _auth.signOut();

  void signUpMobile() async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: countryCode + mobileController.text,
          verificationCompleted: (PhoneAuthCredential authCredential) =>
              debugPrint(authCredential.toString()),
          verificationFailed: (FirebaseAuthException authException) =>
              debugPrint(authException.toString()),
          codeSent: (String verificationID, int? resendCode) {
            Get.to(() => const Material(child: OTPPage()));
            verifyID = verificationID;
            String numberOBS = mobileController.text
                .substring(mobileController.text.length - 4);
            shadowedMobile += numberOBS;
            Get.rawSnackbar(
                message:
                    'OTP has been sent to your mobile number $shadowedMobile');
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      Get.rawSnackbar(message: e.toString());
      debugPrint(e.toString());
    }
  }

  void verifyMobile() async {
    try {
      PhoneAuthCredential authCredential =
          PhoneAuthProvider.credential(verificationId: verifyID, smsCode: otp);
      await _auth.signInWithCredential(authCredential);
      Get.until((route) => route.isFirst);
      Get.rawSnackbar(message: 'OTP verified');
    } catch (e) {
      debugPrint(e.toString());
      Get.rawSnackbar(message: e.toString());
    }
  }
}
