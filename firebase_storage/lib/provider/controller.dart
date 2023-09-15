import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/main.dart';
import 'package:firebase_storage/model/db_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DBController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  final FirebaseFirestore db = FirebaseFirestore.instance;
  static String collectionPath = 'Users';

  void addData() async {
    var data = DBmodel(
        name: name.text, email: email.text, mobile: int.parse(phone.text));
    await db.collection(collectionPath).add(data.fromJson()).whenComplete(() {
      Get.rawSnackbar(message: 'Data saved sucessfully');
      Future.delayed(const Duration(seconds: 1))
          .then((value) => Get.offAll(() => const MyHomePage()));
      name.clear();
      email.clear();
      phone.clear();
    });
  }

  void updateData(DocumentSnapshot snapshot) async {
    var data = DBmodel(
        name: name.text, email: email.text, mobile: int.parse(phone.text));
    await db
        .collection(collectionPath)
        .doc(snapshot.id)
        .update(data.fromJson())
        .whenComplete(() {
      Get.rawSnackbar(message: 'Data updated sucessfully');
      Future.delayed(const Duration(seconds: 1))
          .then((value) => Get.offAll(() => const MyHomePage()));
      name.clear();
      email.clear();
      phone.clear();
    });
  }
}
