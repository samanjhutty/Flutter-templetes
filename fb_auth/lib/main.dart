import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/auth/pages/mobile_login.dart';
import 'package:firebase_authentication/auth/pages/otp_page.dart';
import 'package:firebase_authentication/auth/pages/reauth.dart';
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
            '/signup': (p0) => const SignUp(),
            '/reauth': (p0) => const ReAuthenticate()
          },
          title: 'Firebase Auth',
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

  final String title = 'FB Auth';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: [
          Consumer<SignInAuth>(builder: (context, value, child) {
            var user = value.auth.currentUser;
            return user != null
                ? PopupMenuButton(
                    position: PopupMenuPosition.under,
                    padding: EdgeInsets.zero,
                    child: CircleAvatar(
                        child: user.photoURL == null
                            ? const Icon(Icons.person)
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(user.photoURL.toString(),
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover),
                              )),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          PopupMenuItem(
                              onTap: () => Get.toNamed('/profile'),
                              child: ListTile(
                                leading: CircleAvatar(
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(user.photoURL.toString(),
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.cover),
                                )),
                                title: Text(user.displayName!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                subtitle: const Text('Tap to Change',
                                    style: TextStyle(fontSize: 12)),
                              )),
                          PopupMenuItem(
                              onTap: () => value.logout(),
                              child: const Row(children: [
                                Icon(Icons.logout_rounded),
                                SizedBox(width: 8),
                                Text('Logout')
                              ])),
                          PopupMenuItem(
                              onTap: () async {
                                final authrovider = FirebaseAuth.instance
                                    .currentUser!.providerData[0].providerId;
                                if (authrovider == 'password') {
                                  Get.toNamed('/reauth');
                                } else if (authrovider == 'phone') {
                                  value.sendOTP();
                                } else {
                                  Get.rawSnackbar(
                                      message: 'Please wait for a few seconds');
                                  value.reauth();
                                }
                              },
                              child: const Row(children: [
                                Icon(Icons.delete_forever_rounded,
                                    color: Colors.red),
                                SizedBox(width: 8),
                                Text('Delete Account')
                              ]))
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
