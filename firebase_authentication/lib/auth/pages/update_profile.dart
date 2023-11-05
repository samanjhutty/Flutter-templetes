import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/main.dart';
import 'package:firebase_authentication/provider/profileimage_controller.dart';
import 'package:firebase_authentication/provider/signup_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final SignUpAuth _signUpAuth = Get.put(SignUpAuth());
  final ProfileController profile = Get.put(ProfileController());
  final User? _user = FirebaseAuth.instance.currentUser;
  final double myWidth = 350;
  Widget? btn;

  @override
  void initState() {
    _signUpAuth.username.text =
        _user!.displayName != null ? _user!.displayName!.trim() : '';
    btn = const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.arrow_forward_rounded),
      SizedBox(width: 8),
      Text('Finish')
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    return ChangeNotifierProvider(
      create: (_) => ProfileController(),
      builder: (context, child) => Consumer<ProfileController>(
          builder: (context, provider, child) => Center(
                  child: SingleChildScrollView(
                      child: WillPopScope(
                onWillPop: () {
                  const AlertDialog(
                      title: Text('Are you Sure?'),
                      content: Text('This will cancel the login process'));
                  return Future(() => false);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CircleAvatar(
                            radius: 60,
                            child: provider.image == null
                                ? _user!.photoURL == null
                                    ? const Icon(Icons.person, size: 56)
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(_user!.photoURL!,
                                            height: double.infinity,
                                            width: double.infinity,
                                            fit: BoxFit.cover),
                                      )
                                : kIsWeb
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.memory(provider.webImage!,
                                            height: double.infinity,
                                            width: double.infinity,
                                            fit: BoxFit.cover),
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.file(provider.image!,
                                            height: double.infinity,
                                            width: double.infinity,
                                            fit: BoxFit.cover),
                                      ),
                          ),
                        ),
                        IconButton(
                          icon: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.camera_alt, size: 20)),
                          onPressed: () => profileController.pickImage(),
                        )
                      ]),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Update Profile',
                            style: TextStyle(
                                fontFeatures: [FontFeature.swash()],
                                fontSize: 32))),
                    const SizedBox(height: 8),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                            'Set additional information for your Account.')),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        width: myWidth,
                        child: TextFormField(
                            controller: _signUpAuth.username,
                            onChanged: (value) {
                              _signUpAuth.username.text = value.trim();
                            },
                            decoration: const InputDecoration(
                                labelText: 'Enter Name',
                                border: OutlineInputBorder()),
                            keyboardType: TextInputType.name)),
                    Container(
                        padding: const EdgeInsets.only(top: 16),
                        width: myWidth,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16)),
                            onPressed: () async {
                              setState(() {
                                btn = const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator());
                              });
                              await profile.uploadImage();
                              await _user!
                                  .updateDisplayName(
                                      _signUpAuth.username.text.trim())
                                  .whenComplete(() {
                                Get.rawSnackbar(message: 'Success');
                                Get.offAll(() => const MyHomePage());
                              });
                            },
                            child: btn)),
                  ],
                ),
              )))),
    );
  }
}
