import 'dart:ui';
import 'package:firebase_authentication/auth/signup.dart';
import 'package:firebase_authentication/firebase/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({Key? key}) : super(key: key);

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  final SignUpAuth _signUpAuth = Get.put(SignUpAuth());
  @override
  Widget build(BuildContext context) => Stack(children: [
        Center(
            child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: CircleAvatar(
                        radius: 64, child: Icon(Icons.phone, size: 60))),
                const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Sign Up with Mobile',
                        style: TextStyle(
                            fontFeatures: [FontFeature.swash()],
                            fontSize: 32))),
                const SizedBox(height: 8),
                const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text('Enter a 10 digit mobile number to continue.')),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: 350,
                    child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        controller: _signUpAuth.phone,
                        decoration: InputDecoration(
                            labelText: 'Enter Mobile Number',
                            prefixText: _signUpAuth.countryCode,
                            border: const OutlineInputBorder()),
                        maxLength: 10,
                        keyboardType: TextInputType.phone)),
                Container(
                    padding: const EdgeInsets.only(top: 16),
                    width: 350,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16)),
                        onPressed: () => _signUpAuth.mobileSignIn(),
                        icon: const Icon(Icons.arrow_forward_rounded),
                        label: const Text('Get OTP'))),
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an Account?'),
                          TextButton(
                              onPressed: () => Get.off(
                                  () => const Material(child: EmailLogin())),
                              child: const Text('Sign In'))
                        ]))
              ]),
        )),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ))
      ]);
}
