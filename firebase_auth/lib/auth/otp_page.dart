import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  final String title = 'OTP Page';
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [AppBar(), Text(widget.title)],
    );
  }
}
