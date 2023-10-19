import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Icon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App Icon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
            title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: scheme.primary),
        )),
        body: const Center(
          child: Text(
            'This app shows how to change App icon in an app, Also App Name.',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
          ),
        ));
  }
}
