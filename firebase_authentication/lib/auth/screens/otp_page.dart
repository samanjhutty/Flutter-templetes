import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../firebase/signup_controller.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  final String title = 'OTP Page';
  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final SignUpAuth _signUpAuth = Get.put(SignUpAuth());

  @override
  Widget build(BuildContext context) => Stack(children: [
        Center(
            child: SingleChildScrollView(
          child: Column(children: [
            const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: CircleAvatar(
                    radius: 64, child: Icon(Icons.message_rounded, size: 60))),
            const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('OTP Verification',
                    style: TextStyle(
                        fontFeatures: [FontFeature.swash()], fontSize: 32))),
            const SizedBox(height: 8),
            Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                    'Enter the OTP sent to you mobile number ${_signUpAuth.shadowedPhone}')),
            OTPTextField(
                margin: const EdgeInsets.symmetric(vertical: 16),
                fieldStyle: FieldStyle.box,
                spaceBetween: 8,
                fieldWidth: 45,
                width: 350,
                length: 6,
                onChanged: (value) {},
                onCompleted: (value) {
                  _signUpAuth.phoneOTP = value;
                  _signUpAuth.verifyMobile();
                }),
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('OTP not recieved?'),
                  TextButton(onPressed: () {}, child: const Text('Resend'))
                ]))
          ]),
        )),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                )))
      ]);
}
