import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/firebase/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SignInAuth _auth = Get.put(SignInAuth());
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Login with Email'));
}
