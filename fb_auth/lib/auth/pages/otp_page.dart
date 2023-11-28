import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import '../../provider/signup_controller.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  final String title = 'OTP Page';
  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool timerEnabled = true;
  static int seconds = 30;
  Timer? timer;
  List<Widget>? list;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds != 0) {
        setState(() => seconds--);
      } else {
        setState(() {
          timerEnabled = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Material(
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
                        child: Icon(Icons.message_rounded, size: 60))),
                const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('OTP Verification',
                        style: TextStyle(
                            fontFeatures: [FontFeature.swash()],
                            fontSize: 32))),
                const SizedBox(height: 8),
                Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                        'Enter the OTP sent to you mobile number ${context.watch<SignUpAuth>().shadowedPhone}')),
                Consumer<SignUpAuth>(
                  builder: (context, provider, child) => OTPTextField(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      fieldStyle: FieldStyle.box,
                      spaceBetween: 8,
                      fieldWidth: 45,
                      width: 350,
                      length: 6,
                      onChanged: (value) {},
                      onCompleted: (value) {
                        provider.phoneOTP = value;
                        provider.verifyMobile();
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: list = [
                          const Text('OTP not recieved?'),
                          TextButton(
                              onPressed: timerEnabled
                                  ? null
                                  : () {
                                      context.read<SignUpAuth>().mobileSignIn();
                                      seconds = 30;
                                      setState(() {});
                                      timer;
                                    },
                              child: const Text('Resend OTP')),
                          Text('in $seconds',
                              style: const TextStyle(color: Colors.grey))
                        ]))
              ]),
            ))
          ]),
        ),
      );
}
