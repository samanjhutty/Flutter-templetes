import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(
      title: 'Dymanic TextField',
      home: DynamicTextField(title: 'Dymanic TextField'));
}

class DynamicTextField extends StatefulWidget {
  const DynamicTextField({super.key, required this.title});

  final String title;
  @override
  State<StatefulWidget> createState() => TextFieldState();
}

class TextFieldState extends State<DynamicTextField> {
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Dynamic TextField'));
}
