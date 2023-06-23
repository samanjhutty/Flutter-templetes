import 'package:flutter/cupertino.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});
  @override
  // ignore_for_file: library_private_types_in_public_api
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return const Text('Messages Page');
  }
}
