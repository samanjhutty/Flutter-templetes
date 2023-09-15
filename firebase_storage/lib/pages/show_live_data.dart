import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/pages/add_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../provider/controller.dart';

class ShowLiveData extends StatefulWidget {
  const ShowLiveData({super.key});

  @override
  State<ShowLiveData> createState() => _ShowLiveDataState();
}

class _ShowLiveDataState extends State<ShowLiveData> {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection(DBController.collectionPath);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _users == isBlank
            ? const Center(
                child: Text('Please add some data first. Click + to add data',
                    style: TextStyle(color: Colors.grey)))
            : StreamBuilder(
                stream: _users.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> steamSnapshot) {
                  return steamSnapshot.hasData
                      ? ListView.builder(
                          itemCount: steamSnapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, i) {
                            final DocumentSnapshot documentSnapshot =
                                steamSnapshot.data!.docs[i];
                            return Card(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                  onTap: () => Get.to(() => Material(
                                      child:
                                          AddData(snapshot: documentSnapshot))),
                                  title: Table(
                                      defaultColumnWidth:
                                          const IntrinsicColumnWidth(),
                                      children: [
                                        TableRow(children: [
                                          const Text('Name'),
                                          Text(documentSnapshot['Name']
                                              .toString())
                                        ]),
                                        TableRow(children: [
                                          const Text('Email'),
                                          Text(documentSnapshot['EmailAddress']
                                              .toString())
                                        ]),
                                        TableRow(children: [
                                          const Text('Number'),
                                          Text(documentSnapshot['MobileNumber']
                                              .toString())
                                        ])
                                      ]),
                                  trailing: IconButton(
                                      onPressed: () {
                                        _users
                                            .doc(documentSnapshot.id)
                                            .delete();
                                        Get.rawSnackbar(
                                            message:
                                                'Data deleted Sucessfully');
                                      },
                                      icon: const Icon(
                                          Icons.delete_outline_rounded)),
                                ));
                          })
                      : const Center(child: CircularProgressIndicator());
                }),
      );
}
