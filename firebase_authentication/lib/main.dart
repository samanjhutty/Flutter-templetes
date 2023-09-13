import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/auth/pages/update_profile.dart';
import 'package:firebase_authentication/auth/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'provider/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
      title: 'Firebase Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Firebase Authentication';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User? _user;

  @override
  void initState() {
    _user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        _user == null
            ? TextButton.icon(
                onPressed: () => Get.to(() => const Material(child: SignIn())),
                label: const Text('Sign In'),
                icon: const Icon(Icons.login_rounded))
            : PopupMenuButton(
                padding: EdgeInsets.zero,
                child: Row(children: [
                  const CircleAvatar(child: Icon(Icons.person)),
                  const SizedBox(width: 8),
                  Text(_user!.displayName == null
                      ? ''
                      : _user!.displayName.toString())
                ]),
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                          onTap: () => Get.offAll(
                              () => const Material(child: UpdateProfile())),
                          child: const ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Update Profile'))),
                      PopupMenuItem(
                          onTap: () => setState(() {
                                FirebaseAuth.instance.signOut();
                                Get.offAll(() => const MyHomePage());
                                Get.rawSnackbar(
                                    message: 'Sucessfully Logged out');
                              }),
                          child: const ListTile(
                              leading: Icon(Icons.logout_rounded),
                              title: Text('Logout')))
                    ]),
        const SizedBox(width: 16)
      ]),
      body: Center(child: Text(widget.title)));
}
