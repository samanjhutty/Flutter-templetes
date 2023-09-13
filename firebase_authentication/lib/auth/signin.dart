import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../provider/signin_controller.dart';
import 'package:firebase_authentication/auth/pages/mobile_login.dart';
import 'package:firebase_authentication/auth/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final SignInAuth _auth = Get.put(SignInAuth());
  final double myWidth = 350;

  @override
  Widget build(BuildContext context) => Stack(children: [
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
                child: Text('Sign In',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
            Container(
                padding: const EdgeInsets.only(top: 16),
                width: 350,
                child: TextFormField(
                  controller: _auth.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Enter Email Address',
                      border: OutlineInputBorder()),
                )),
            const SizedBox(height: 24),
            Container(
                padding: const EdgeInsets.only(bottom: 16),
                width: myWidth,
                child: TextFormField(
                  controller: _auth.password,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Enter Password',
                      border: OutlineInputBorder()),
                )),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: myWidth,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16)),
                    onPressed: () => _auth.emailLogin(),
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: const Text('Login'))),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 50, child: Divider(thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('OR',
                          style: TextStyle(color: Colors.grey, fontSize: 11)),
                    ),
                    SizedBox(width: 50, child: Divider(thickness: 1))
                  ],
                )),
            const Text('Continue with',
                style: TextStyle(color: Colors.grey, fontSize: 14)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(
                    child: IconButton(
                        tooltip: 'Phone',
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext builder) =>
                                    const Material(child: MobileLogin()))),
                        icon: const Icon(Icons.phone)),
                  ),
                  const SizedBox(width: 35),
                  CircleAvatar(
                      child: IconButton(
                          tooltip: 'Google',
                          onPressed: () => _auth.googleLogin(),
                          icon: Image.asset('lib/assets/images/google.png')))
                ])),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Don't have an Account yet?"),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext builder) =>
                                const Material(child: SignUp()))),
                    child: const Text('Sign Up'))
              ]),
            )
          ],
        )))
      ]);
}
