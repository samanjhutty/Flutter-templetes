import 'package:api/tabs/users.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainTab(title: 'Flutter API'),
      title: 'Flutter API');
}

class MainTab extends StatefulWidget {
  const MainTab({required this.title, super.key});
  final String title;
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: const Users());
}
