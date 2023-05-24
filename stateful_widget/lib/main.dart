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
          appBar: AppBar(title: const Text('Stateful Widget')),
          body: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String nameRow = "abc";
  String nameColn = 'ABC';
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 500,
      child: Column(children: [
        TextField(
            decoration: const InputDecoration(hintText: 'Enter Text'),
            style:
                const TextStyle(fontSize: 20, backgroundColor: Colors.white70),
            onSubmitted: (value) {
              setState(() {
                nameRow = value;
              });
            }),
        Text(nameRow),
        const Divider(
          height: 50,
          thickness: 50,
          color: Colors.transparent,
        ),
        TextField(
            decoration: const InputDecoration(hintText: 'Enter Text'),
            style: const TextStyle(fontSize: 20),
            onChanged: (value) {
              setState(() {
                nameColn = value;
              });
            }),
        Text(nameColn)
      ]),
    ));
  }
}
