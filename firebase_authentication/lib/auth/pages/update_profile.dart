import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/provider/profileimage_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final User? _user = FirebaseAuth.instance.currentUser;
  final double myWidth = 350;
  late Widget btn;

  @override
  void initState() {
    btn = const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.arrow_forward_rounded),
      SizedBox(width: 8),
      Text('Finish')
    ]);

    context.read<ProfileController>().username.text =
        _user!.displayName != null ? _user!.displayName!.trim() : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Material(
      child: Center(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Stack(alignment: Alignment.bottomRight, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Consumer<ProfileController>(
                  builder: (context, value, child) => CircleAvatar(
                    radius: 60,
                    child: value.image == null && value.webImage == null
                        ? _user!.photoURL == null
                            ? const Icon(Icons.person, size: 56)
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(_user!.photoURL!,
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover),
                              )
                        : kIsWeb
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.memory(
                                    context
                                        .watch<ProfileController>()
                                        .webImage!,
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(value.image!,
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover),
                              ),
                  ),
                ),
              ),
              IconButton(
                icon: CircleAvatar(
                    backgroundColor: scheme.surface,
                    child: const Icon(Icons.camera_alt, size: 20)),
                onPressed: () => context.read<ProfileController>().pickImage(),
              )
            ]),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Update Profile',
                  style: TextStyle(
                      fontFeatures: [FontFeature.swash()], fontSize: 32))),
          const SizedBox(height: 8),
          const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text('Set additional information for your Account.')),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: myWidth,
              child: TextFormField(
                  controller: context.read<ProfileController>().username,
                  decoration: const InputDecoration(
                      labelText: 'Enter Name', border: OutlineInputBorder()),
                  keyboardType: TextInputType.name)),
          Consumer<ProfileController>(builder: (context, provider, child) {
            return Container(
                padding: const EdgeInsets.only(top: 16),
                width: myWidth,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16)),
                    onPressed: () async {
                      setState(() {
                        btn = const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator());
                      });
                      provider.updateProfile();
                      Navigator.pop(context);
                    },
                    child: btn));
          }),
        ],
      ))),
    );
  }
}
