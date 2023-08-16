import 'package:flutter/material.dart';
import 'package:menubars/menubars.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        title: 'Menu Bars',
        home: const MainPage(title: 'Menu Bars'));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: ListView(
          children: const [MyMenuBars()],
        ));
  }
}
