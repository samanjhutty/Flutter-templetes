import 'package:end_drawer/home_page.dart';
import 'package:end_drawer/messages.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(home: MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore_for_file: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> topTabs = <Tab>[
    const Tab(icon: Icon(Icons.home_filled)),
    const Tab(icon: Icon(Icons.message_rounded))
  ];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _tabController = TabController(length: topTabs.length, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  icon: const Icon(Icons.menu),
                  hoverColor: Colors.transparent))
        ],
        title: const Text('End Drawer'),
        bottom: TabBar(tabs: topTabs, controller: _tabController),
      ),
      endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width * .6, child: const Drawer()),
      body: TabBarView(
          controller: _tabController, children: const [HomePage(), Messages()]),
    );
  }
}
