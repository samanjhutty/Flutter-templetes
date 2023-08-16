import 'package:api/models/users_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key, required this.id, required this.data});

  final int id;
  final List<UsersModel>? data;
  @override
  State<StatefulWidget> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) => CupertinoPopupSurface(
      child: Container(
          color: Colors.white,
          height: 400,
          width: double.infinity,
          child: Center(
              child:
                  Text('User Details of: ${widget.data![widget.id].name}'))));
}
