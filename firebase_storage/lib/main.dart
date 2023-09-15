import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/pages/add_data.dart';
import 'package:firebase_storage/pages/show_data.dart';
import 'package:firebase_storage/pages/show_live_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'provider/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
      title: 'Firestore DB Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
          useMaterial3: true),
      home: const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Firebase Firestore';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: [
          TextButton.icon(
              label: const Text('Add Data'),
              onPressed: () => Get.to(() => Material(child: AddData())),
              icon: const Icon(Icons.add_rounded)),
          const SizedBox(width: 16)
        ]),
        body: const ShowLiveData(),

        ///ShowData() show static data which is fetched through a one-time snapshot of frestore
        ///for better data views i.e. live data updates use ShowLiveData()
      );
}
