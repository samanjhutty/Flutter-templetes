import 'package:flutter/cupertino.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Content'),
    );
  }
}
