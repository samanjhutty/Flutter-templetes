import 'package:flutter/material.dart';
import 'my_home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Stateless Widget')),
        body: const MyHomeApp(),
      ),
    );
  }
}
