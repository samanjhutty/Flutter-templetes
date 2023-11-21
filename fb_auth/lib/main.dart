import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/auth/pages/mobile_login.dart';
import 'package:firebase_authentication/auth/pages/otp_page.dart';
import 'package:firebase_authentication/auth/pages/update_profile.dart';
import 'package:firebase_authentication/auth/signin.dart';
import 'package:firebase_authentication/auth/signup.dart';
import 'package:firebase_authentication/provider/profileimage_controller.dart';
import 'package:firebase_authentication/provider/signin_controller.dart';
import 'package:firebase_authentication/provider/signup_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'provider/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProfileController()),
          ChangeNotifierProvider(create: (context) => SignUpAuth()),
          ChangeNotifierProvider(create: (context) => SignInAuth())
        ],
        child: GetMaterialApp(
          initialRoute: '/',
          routes: {
            '/': (p0) => const MyHomePage(),
            '/mobile': (p0) => const MobileLogin(),
            '/otppage': (p0) => const OTPPage(),
            '/profile': (p0) => const UpdateProfile(),
            '/signin': (p0) => const SignIn(),
            '/signup': (p0) => const SignUp()
          },
          title: 'Firebase Demo',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple, brightness: Brightness.light),
              useMaterial3: true),
          darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple, brightness: Brightness.dark),
              useMaterial3: true),
          themeMode: ThemeMode.system,
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Firebase Authentication';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: [
          Consumer<SignInAuth>(builder: (context, value, child) {
            var user = auth.currentUser;
            return user != null
                ? PopupMenuButton(
                    padding: EdgeInsets.zero,
                    child: Row(children: [
                      CircleAvatar(
                        child: value.user!.photoURL == null
                            ? const Icon(Icons.person)
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    value.user!.photoURL.toString(),
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover),
                              ),
                      ),
                      const SizedBox(width: 8),
                      Text(value.user!.displayName == null
                          ? ''
                          : value.user!.displayName.toString()),
                    ]),
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                              onTap: () => Get.offAllNamed('/profile'),
                              child: const ListTile(
                                  leading: Icon(Icons.edit),
                                  title: Text('Update Profile'))),
                          PopupMenuItem(
                              onTap: () => value.logout(),
                              child: const ListTile(
                                  leading: Icon(Icons.logout_rounded),
                                  title: Text('Logout'))),
                          PopupMenuItem(
                              onTap: () => value.deleteUser(),
                              child: const ListTile(
                                  leading: Icon(Icons.delete_forever_rounded),
                                  title: Text('Delete Account')))
                        ])
                : TextButton.icon(
                    onPressed: () => Get.toNamed('/signin'),
                    label: const Text('Sign In'),
                    icon: const Icon(Icons.login_rounded));
          }),
          const SizedBox(width: 16)
        ]),
        body: const Center(
            child: Text(
          'Tap on the profile icon to begin',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        )));
  }
}
