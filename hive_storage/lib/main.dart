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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  final String title = 'Hive Storage';

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
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: scheme.error),
              onPressed: () {
                dbBox.isEmpty
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('List is already Empty!')))
                    : {
                        dbBox.clear(),
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('All data has been cleared.'))),
                        Future.delayed(const Duration(seconds: 1)).then(
                            (value) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Material(child: MyHomePage())),
                                (route) => route.isCurrent))
                      };
              },
              icon: const Icon(Icons.delete_forever_rounded),
              label: const Text('Delete All')),
          IconButton(
              color: scheme.primary,
              tooltip: 'Refresh',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const Material(child: MyHomePage())),
                    (route) => route.isCurrent);
              },
              icon: const Icon(Icons.refresh_rounded)),
          const SizedBox(width: 16)
        ],
      ),
      body: const MainScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Data',
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
