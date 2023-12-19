import 'package:api_login/controller/login_controller.dart';
import 'package:api_login/view/signin.dart';
import 'package:api_login/view/signup.dart';
import 'package:api_login/view/userdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('API-LoginBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => LoginAuth())],
        child: GetMaterialApp(
          routes: {
            '/': (p0) => const MyHomePage(),
            '/signup': (p0) => const SignUp(),
            '/signin': (p0) => const SignIn()
          },
          title: 'API Login',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'API Auth';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Box box = Hive.box('API-LoginBox');

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context);
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Consumer<LoginAuth>(builder: (context, provider, child) {
      provider.refresh();
      return provider.login == false || provider.login == null
          ? SafeArea(
              child: SizedBox(
              width: device.orientation == Orientation.portrait ? 360 : 450,
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text('You need to Login first',
                        style: TextStyle(color: scheme.primary, fontSize: 36)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () => Get.toNamed('/signin'),
                        child: const Text('Sign In / Sign Up'))
                  ])),
            ))
          : Scaffold(
              appBar: AppBar(title: Text(widget.title)),
              body: const UserData());
    });
  }
}
