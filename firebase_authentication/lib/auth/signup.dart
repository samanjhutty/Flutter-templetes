import 'package:firebase_authentication/provider/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpAuth _auth = Get.put(SignUpAuth());
  final double myWidth = 350;
  final double boxHeight = 20;
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Stack(children: [
          AppBar(),
          Center(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CircleAvatar(
                      radius: 60, child: Icon(Icons.login_rounded, size: 56))),
              const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text('Create Account',
                      style: TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold))),
              Container(
                  padding: const EdgeInsets.only(top: 16),
                  width: 350,
                  child: TextFormField(
                    controller: _auth.username,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        labelText: 'Enter Name', border: OutlineInputBorder()),
                  )),
              SizedBox(height: boxHeight),
              SizedBox(
                  width: 350,
                  child: TextFormField(
                    controller: _auth.emailAddress,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Enter Email Address',
                        border: OutlineInputBorder()),
                  )),
              SizedBox(height: boxHeight),
              SizedBox(
                  width: myWidth,
                  child: TextFormField(
                    controller: _auth.password,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                        labelText: 'Enter Password',
                        border: OutlineInputBorder()),
                  )),
              SizedBox(height: boxHeight),
              Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  width: myWidth,
                  child: TextFormField(
                    controller: _auth.confirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder()),
                  )),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: myWidth,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16)),
                      onPressed: () => _auth.createAccount(),
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: const Text('Create Account'))),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Already have an Account?"),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Sign In'))
              ])
            ],
          )))
        ]),
      );
}
