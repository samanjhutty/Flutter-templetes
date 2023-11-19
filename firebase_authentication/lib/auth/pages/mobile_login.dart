import 'dart:ui';
import 'package:firebase_authentication/auth/signup.dart';
import 'package:firebase_authentication/provider/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({Key? key}) : super(key: key);

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  final double myWidth = 350;
  Widget? btn;

  @override
  void initState() {
    btn = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.arrow_forward_rounded), Text('Get OTP')],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Stack(children: [
          AppBar(),
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
                      child:
                          Text('Enter a 10 digit mobile number to continue.')),
                  const SizedBox(height: 24),
                  Container(
                      padding: const EdgeInsets.only(bottom: 16),
                      width: myWidth,
                      child: TextFormField(
                          controller: context.watch<SignUpAuth>().phone,
                          decoration: InputDecoration(
                              labelText: 'Enter Mobile Number',
                              prefixText:
                                  context.watch<SignUpAuth>().countryCode,
                              border: const OutlineInputBorder()),
                          maxLength: 10,
                          keyboardType: TextInputType.phone)),
                  Container(
                      padding: const EdgeInsets.only(top: 16),
                      width: myWidth,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16)),
                          onPressed: () {
                            context.read<SignUpAuth>().mobileSignIn();
                            setState(() {
                              if (context
                                      .watch<SignUpAuth>()
                                      .phone
                                      .text
                                      .length ==
                                  10) {
                                btn = const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator());
                              }
                            });
                          },
                          child: btn)),
                  Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an Account?'),
                            TextButton(
                                onPressed: () => Get.off(
                                    () => const Material(child: SignUp())),
                                child: const Text('Sign In'))
                          ]))
                ]),
          ))
        ]),
      );
}
