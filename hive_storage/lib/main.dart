import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_storage/model/boxes.dart';
import 'package:hive_storage/model/data_model.dart';
import 'package:hive_storage/pages/add_data.dart';
import 'package:hive_storage/pages/show_data.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  box = await Hive.openBox<DataModel>('DB');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hive',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true),
      home: const MyHomePage(title: 'Hive Storage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: scheme.primary)),
      ),
      body: const MainScreen(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const Material(child: AddData()),
            )),
      ),
    );
  }
}
