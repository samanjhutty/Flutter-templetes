import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(home: MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
      IconButton(
          hoverColor: Colors.transparent,
          onPressed: () {
            const snackBar = SnackBar(
                content: Text(
                  'Search pressed',
                ),
                duration: Duration(seconds: 1));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(Icons.search)),
      IconButton(
          hoverColor: Colors.transparent,
          padding: const EdgeInsets.only(right: 10),
          onPressed: () {
            const snackBar = SnackBar(
              content: Text('Menu Pressed'),
              duration: Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(Icons.menu)),
    ], title: const Text('AppBar Actions')));
  }
}
