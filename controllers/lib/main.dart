import 'dart:ui';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Controllers')),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final formkey = GlobalKey<FormState>();
  var name = '';
  var email = '';
  var password = '';

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Form(
            key: formkey,
            child: SizedBox(
              width: 500,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Divider(
                  height: 30,
                  color: Colors.transparent,
                ),
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name')),
                const Divider(
                  height: 20,
                  color: Colors.transparent,
                ),
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email')),
                const Divider(
                  height: 20,
                  color: Colors.transparent,
                ),
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password')),
                const Divider(
                  height: 50,
                  color: Colors.transparent,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          name = nameController.text;
                          email = emailController.text;
                          password = passwordController.text;
                        });
                      }
                    },
                    child: const Text('Submit')),
                const Divider(
                  height: 100,
                  color: Colors.transparent,
                ),
                Text(
                  'Name: $name, Email: $email, Password: $password',
                  style: const TextStyle(fontSize: 20),
                )
              ]),
            )));
  }
}
