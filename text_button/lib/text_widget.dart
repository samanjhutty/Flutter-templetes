import 'dart:io';

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          stdout.writeln('Button Pressed');
        },
        child: const Text('Click Me'),
      ),
    );
  }
}
