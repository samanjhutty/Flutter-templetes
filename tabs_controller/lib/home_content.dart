import 'package:flutter/cupertino.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  @override
  _HomeContextState createState() => _HomeContextState();
}

class _HomeContextState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Content'),
    );
  }
}
