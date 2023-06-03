import 'package:flutter/material.dart';
import 'package:tabs_controller/home_content.dart';
import 'package:tabs_controller/messeges.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabcontroller;
  final List<Tab> topTabs = <Tab>[
    const Tab(icon: Icon(Icons.home_outlined)),
    const Tab(icon: Icon(Icons.message_outlined))
  ];

  @override
  void initState() {
    _tabcontroller = TabController(length: topTabs.length, vsync: this)
      ..addListener(() {
        setState(() {});
        super.initState();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabs'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  const snackBar = SnackBar(content: Text('Button Clicked'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
              icon: const Icon(Icons.menu_outlined))
        ],
        bottom: TabBar(
          tabs: topTabs,
          controller: _tabcontroller,
          indicatorColor: Colors.blue,
        ),
      ),
      body: TabBarView(
          controller: _tabcontroller,
          children: const [HomeContent(), Messages()]),
    );
  }
}
