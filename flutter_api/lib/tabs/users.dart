import 'dart:ui';

import 'package:api/models/users_models.dart';
import 'package:api/services/api_services.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  late List<UsersModel>? _userData = [];

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    _userData = await ApiServices().getUsers();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => Container(
      child: _userData!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DefaultTextStyle(
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black87,
                            fontFeatures: [FontFeature.swash()]),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 24),
                                  child: Text('S.no')),
                              Expanded(child: Text('Name')),
                              Expanded(child: Text('Email')),
                              Expanded(child: Text('Company')),
                            ]),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: _userData!.length,
                      itemBuilder: (context, i) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: CircleAvatar(
                                          radius: 16,
                                          child: Text(
                                              _userData![i].id.toString())),
                                    ),
                                    Expanded(
                                      child: Text(
                                        _userData![i].name.toString(),
                                        style: const TextStyle(
                                            fontFeatures: [FontFeature.swash()],
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        _userData![i].email.toString(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                          _userData![i]
                                              .company!
                                              .name
                                              .toString(),
                                          textAlign: TextAlign.left),
                                    )
                                  ]),
                            ),
                          )),
                ),
              ],
            ));
}
