import 'package:drawer_layout/assets.dart';
import 'package:drawer_layout/drawer.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyMainPage(
        title: 'Drawer UI',
      ),
    );
  }
}

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key, required this.title});

  final String title;
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<MyMainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text(widget.title), actions: [
          IconButton(
              hoverColor: Colors.transparent,
              onPressed: () {
                const snackBar = SnackBar(content: Text('Search Pressed'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(Icons.search_rounded)),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
                hoverColor: Colors.transparent,
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                icon: const Icon(Icons.menu_rounded)),
          )
        ]),
        endDrawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: const MyDrawer()));
  }
}
