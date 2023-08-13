import 'package:flutter/material.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});
  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) => const Center(child: Text('Todos'));
}
