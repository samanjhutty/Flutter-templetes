import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) => GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
      itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(children: [Text('')]),
              ),
            ),
          ));
}
