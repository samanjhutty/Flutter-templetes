import 'package:api_login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();
  final double myWidth = 350;
  final double boxHeight = 20;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Stack(children: [
            Center(
                child: SingleChildScrollView(
                    child: Form(
              key: formkey,
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: CircleAvatar(
                          radius: 60,
                          child: Icon(Icons.login_rounded, size: 56))),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text('Create Account',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: scheme.primary))),
                  Container(
                      padding: const EdgeInsets.only(top: 16),
                      width: 350,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'name is required';
                          } else {
                            return null;
                          }
                        },
                        controller: context.watch<LoginAuth>().name,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                            labelText: 'Enter Name',
                            border: OutlineInputBorder()),
                      )),
                  SizedBox(height: boxHeight),
                  SizedBox(
                      width: 350,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be emptty';
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
                  SizedBox(height: boxHeight),
                  SizedBox(
                      width: myWidth,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: context.watch<LoginAuth>().password,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'confirmation is required';
                          } else {
                            return null;
                          }
                        },
                        controller: context.watch<LoginAuth>().confirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder()),
                      )),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: myWidth,
                      child: Consumer<LoginAuth>(
                          builder: (context, provider, child) {
                        return ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16)),
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                await provider.createAccount();
                              }
                            },
                            icon: const Icon(Icons.arrow_forward_rounded),
                            label: const Text('Create Account'));
                      })),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text("Already have an Account?"),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Sign In'))
                  ])
                ],
              ),
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

    provider.name.dispose();
    provider.emailAddress.dispose();
    provider.password.dispose();
    provider.confirmPassword.dispose();
    super.dispose();
  }
}
