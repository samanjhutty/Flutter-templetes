import 'package:employee_attedence_clone/tabs/leaves.dart';
import 'package:employee_attedence_clone/pages/greetingcard.dart';
import 'package:employee_attedence_clone/pages/templetes.dart';
import 'package:employee_attedence_clone/tabs/reports.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      title: 'Attendence UI');
}

get primaryColorDark => Colors.tealAccent[700] as Color;
get primaryColor => Colors.tealAccent[400] as Color;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static String _title = 'Attendence UI';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> _tabs = const [Tab(text: 'REPORTS'), Tab(text: 'LEAVES')];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[50],
          foregroundColor: Colors.black87,
          title: Text(getTitle, key: const Key('appBarTitle')),
          actions: [
            IconButton(
                color: Colors.black45,
                splashRadius: 24,
                tooltip: 'Templetes',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const Material(child: Templates()))),
                icon: const Icon(Icons.data_thresholding)),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: IconButton(
                    color: primaryColor,
                    splashRadius: 24,
                    tooltip: 'Greeting Card',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Material(
                                  child: GreetingCard(),
                                ))),
                    icon: const Icon(Icons.card_giftcard)))
          ],
          bottom: TabBar(
              labelColor: primaryColorDark,
              unselectedLabelColor: Colors.black26,
              indicatorColor: primaryColorDark,
              tabs: _tabs,
              controller: _tabController)),
      body: TabBarView(
          controller: _tabController,
          children: const [CompanyReports(), Leaves()]));
}

set setTitle(String title) {
  MainPage._title = title;
}

get getTitle => MainPage._title;
