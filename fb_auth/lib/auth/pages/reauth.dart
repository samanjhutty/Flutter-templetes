import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../provider/signin_controller.dart';

class ReAuthenticate extends StatefulWidget {
  const ReAuthenticate({super.key});

  @override
  State<ReAuthenticate> createState() => _ReAuthenticateState();
}

class _ReAuthenticateState extends State<ReAuthenticate> {
  final double myWidth = 350;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(children: [
          AppBar(),
          Center(
              child: SingleChildScrollView(
            child: Column(children: [
              const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CircleAvatar(
                      radius: 64,
                      child: Icon(Icons.verified_rounded, size: 60))),
              const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('User Verification',
                      style: TextStyle(
                          fontFeatures: [FontFeature.swash()], fontSize: 32))),
              const SizedBox(height: 8),
              const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                      'Reauthenticate with Credentials to Deleted Account')),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: myWidth,
                  child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: context.read<SignInAuth>().password,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Enter Password/OTP',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.name)),
              Consumer<SignInAuth>(builder: (context, provider, child) {
                return Container(
                    padding: const EdgeInsets.only(top: 16),
                    width: myWidth,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16)),
                      onPressed: () {
                        provider.reauth();
                        Get.until(ModalRoute.withName('/'));
                      },
                      label: const Text('Delete Account'),
                      icon: const Icon(Icons.delete_rounded),
                    ));
              }),
            ]),
          ))
        ]),
      ),
    );
  }
}
