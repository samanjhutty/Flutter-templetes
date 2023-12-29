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
      return Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: provider.login == false || provider.login == null
              ? SafeArea(
                  child: Center(
                    child: Container(
                      width: device.orientation == Orientation.portrait
                          ? double.infinity
                          : 450,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            CircleAvatar(
                                radius: 160,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  'lib/icons/api.png',
                                  height: double.infinity,
                                  width: double.infinity,
                                )),
                            const Text(
                                'You need to Login to Continue to the App',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 32)),
                            Row(children: [
                              Expanded(
                                  child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                    backgroundColor: scheme.primary,
                                    foregroundColor: scheme.onPrimary,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20)),
                                onPressed: () => Get.toNamed('/signin'),
                                child: const Text('Login'),
                              ))
                            ]),
                          ]),
                    ),
                  ),
                )
              : const UserData());
    });
  }
}
