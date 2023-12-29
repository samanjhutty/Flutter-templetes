import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controller/login_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formkey = GlobalKey<FormState>();
  final double myWidth = 350;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Stack(children: [
            Center(
                child: SingleChildScrollView(
                    child: Form(
              key: formkey,
              child: Column(children: [
                const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: CircleAvatar(
                        radius: 60,
                        child: Icon(Icons.login_rounded, size: 56))),
                const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text('Sign In',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold))),
                Container(
                    padding: const EdgeInsets.only(top: 16),
                    width: 350,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter email address first';
                        } else {
                          return null;
                        }
                      },
                      controller: context.watch<LoginAuth>().emailAddress,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: 'Enter Email Address',
                          border: OutlineInputBorder()),
                    )),
                const SizedBox(height: 24),
                Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    width: myWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'password is required';
                              } else {
                                return null;
                              }
                            },
                            controller: context.watch<LoginAuth>().password,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              labelText: 'Enter Password',
                              border: OutlineInputBorder(),
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Consumer<LoginAuth>(
                                      builder: (context, provider, child) {
                                    return ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20)),
                                        onPressed: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            provider.signIn();
                                          }
                                        },
                                        icon: const Icon(
                                            Icons.arrow_forward_rounded),
                                        label: const Text('Login'));
                                  }),
                                ),
                              ],
                            )),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an Account yet?"),
                          TextButton(
                              onPressed: () => Get.toNamed('/signup'),
                              child: const Text('Sign Up'))
                        ]))
              ]),
            ))),
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded))
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    final provider = context.read<LoginAuth>();
    provider.password.dispose();
    provider.emailAddress.dispose();
    super.dispose();
  }
}
