import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/main.dart';
import 'package:firebase_authentication/provider/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final SignUpAuth _signUpAuth = Get.put(SignUpAuth());
  final User? _user = FirebaseAuth.instance.currentUser;
  final double myWidth = 350;

  @override
  Widget build(BuildContext context) => Center(
          child: SingleChildScrollView(
              child: WillPopScope(
        onWillPop: () {
          const AlertDialog(
              title: Text('Are you Sure?'),
              content: Text('This will cancel the login process'));
          return Future(() => false);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CircleAvatar(
                    radius: 80,
                    child: Image.asset(
                      'lib/assets/images/idcard.png',
                    ))),
            const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Update Profile',
                    style: TextStyle(
                        fontFeatures: [FontFeature.swash()], fontSize: 32))),
            const SizedBox(height: 8),
            const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text('Set additional information for your Account.')),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: myWidth,
                child: TextFormField(
                    onChanged: (value) {
                      _signUpAuth.username.text = value;
                    },
                    decoration: InputDecoration(
                        label: Text(_user!.displayName != null
                            ? _user!.displayName.toString()
                            : ''),
                        labelText: 'Enter Name',
                        border: const OutlineInputBorder()),
                    keyboardType: TextInputType.name)),
            Container(
                padding: const EdgeInsets.only(top: 16),
                width: myWidth,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16)),
                    onPressed: () {
                      FirebaseAuth.instance.currentUser!
                          .updateDisplayName(_signUpAuth.username.text);
                      Get.rawSnackbar(message: 'Success');
                      Future.delayed(const Duration(seconds: 2)).then(
                          (value) => Get.offAll(() => const MyHomePage()));
                    },
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: const Text('Finish'))),
          ],
        ),
      )));
}
