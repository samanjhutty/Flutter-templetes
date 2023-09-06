import 'dart:ui';

import 'package:firebase_authentication/firebase/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  final title = 'Login Page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuthentication authentication = Get.put(FirebaseAuthentication());
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: CircleAvatar(radius: 64, child: Icon(Icons.phone, size: 60))),
      const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('Sign Up',
              style: TextStyle(
                  fontFeatures: [FontFeature.swash()], fontSize: 32))),
      const SizedBox(height: 8),
      const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text('Enter a 10 digit mobile number to continue.')),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: 350,
          child: TextFormField(
              textAlignVertical: TextAlignVertical.top,
              controller: authentication.mobileController,
              decoration: InputDecoration(
                  labelText: 'Enter Mobile Number',
                  prefixText: authentication.countryCode,
                  border: const OutlineInputBorder()),
              maxLength: 10,
              keyboardType: TextInputType.phone)),
      Container(
          padding: const EdgeInsets.only(top: 16),
          width: 350,
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16)),
              onPressed: () => authentication.signUpMobile(),
              icon: const Icon(Icons.arrow_forward_rounded),
              label: const Text('Get OTP'))),
      Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Already have a account?'),
            TextButton(onPressed: () {}, child: const Text('Sign in'))
          ]))
    ])));
  }
}
