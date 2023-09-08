import 'package:firebase_authentication/firebase/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  SignUpAuth _auth = Get.put(SignUpAuth());
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Sign up with Email'));
}
