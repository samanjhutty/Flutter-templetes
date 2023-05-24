import 'package:flutter/material.dart';

class ElevButton extends StatelessWidget {
  const ElevButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 151, 28, 251),
              textStyle: const TextStyle(fontStyle: FontStyle.italic),
              padding: const EdgeInsets.all(30)),
          onPressed: () {
            const snackbar = SnackBar(content: Text('Buttton Pressed'));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          child: const Text('Click Me')),
    );
  }
}
