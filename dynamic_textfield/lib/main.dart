import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
      title: 'Dymanic TextField', home: MainPage(title: 'Dymanic TextField'));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final List<TextEditingController> controllerList = [TextEditingController()];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                controllerList.add(TextEditingController());
              }),
          tooltip: 'Add TextField',
          child: const Icon(Icons.add)),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: controllerList.length,
              itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(children: [
                    Expanded(
                        child: TextField(
                            controller: controllerList[i],
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Name'))),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: IconButton(
                          onPressed: () => setState(() {
                                controllerList.removeAt(i);
                              }),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red[800],
                          ),
                          splashRadius: 24),
                    )
                  ])))));
}
