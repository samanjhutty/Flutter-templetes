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
          appBar: AppBar(title: const Text('Floating Action Button')),
          body: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
          onPressed: () {
            const snackBar = SnackBar(content: Text('Button Pressed'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.ads_click)),
    );
  }
}
