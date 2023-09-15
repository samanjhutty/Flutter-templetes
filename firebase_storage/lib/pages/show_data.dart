import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/pages/add_data.dart';
import 'package:firebase_storage/provider/controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/db_model.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  RxList<DBmodel> dbList = RxList();

  void getData() async {
    var con = await db.collection(DBController.collectionPath).get();
    setState(() {
      for (var cons in con.docs) {
        dbList.add(DBmodel.toJson(cons.data()));
      }
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: dbList.isEmpty
          ? const Center(
              child: Text('Please add some data first. Click + to add data',
                  style: TextStyle(color: Colors.grey)))
          : ListView(
              children: dbList
                  .map((element) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          onTap: () => Get.to(() => Material(child: AddData())),
                          title: Table(
                              defaultColumnWidth: const IntrinsicColumnWidth(),
                              children: [
                                TableRow(children: [
                                  const Text('Name'),
                                  Text(element.name.toString())
                                ]),
                                TableRow(children: [
                                  const Text('Email'),
                                  Text(element.email.toString())
                                ]),
                                TableRow(children: [
                                  const Text('Number'),
                                  Text(element.mobile.toString())
                                ])
                              ]),
                          trailing: IconButton(
                              onPressed: () => setState(() {
                                    if (kIsWeb) {
                                    } else {
                                      db
                                          .collection(
                                              DBController.collectionPath)
                                          .doc()
                                          .delete();
                                      Get.rawSnackbar(message: 'Data deleted');
                                    }
                                    dbList.remove(element);
                                  }),
                              icon: const Icon(Icons.delete_outline_rounded)),
                        ),
                      ))
                  .toList(),
            ));
}
