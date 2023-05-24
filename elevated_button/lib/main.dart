import 'package:flutter/material.dart';
import 'elevated_button.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Elevated Button'),
            backgroundColor: const Color.fromARGB(255, 151, 28, 251),
          ),
          body: const ElevButton()),
    );
  }
}
