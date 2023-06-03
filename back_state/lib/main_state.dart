import 'package:back_state/home_page.dart';
import 'package:back_state/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> topTabs = <Tab>[
    const Tab(icon: Icon(Icons.home_filled)),
    const Tab(icon: Icon(Icons.message_rounded))
  ];
  Future<bool> _onWillPop() async {
    if (_tabController!.index == 0) {
      await SystemNavigator.pop();
    }
    Future.delayed(const Duration(milliseconds: 200), () {
      _tabController?.index = 0;
    });
    return _tabController?.index == 0;
  }

  @override
  void initState() {
    _tabController = TabController(length: topTabs.length, vsync: this)
      ..addListener(() {
        setState(() {});
        super.initState();
      });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () {
                        const snackBar = SnackBar(content: 'Menu Pressed');
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: const Icon(Icons.menu),
                      hoverColor: Colors.transparent))
            ],
            title: const Text('Back State'),
            bottom: TabBar(tabs: topTabs, controller: _tabController),
          ),
          body: TabBarView(
              controller: _tabController,
              children: const [HomePage(), Messages()]),
        ));
  }
}
