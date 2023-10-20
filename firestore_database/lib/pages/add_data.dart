import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../provider/controller.dart';

class AddData extends StatefulWidget {
  const AddData({super.key, this.snapshot});
  final DocumentSnapshot? snapshot;
  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final DBController _dbController = Get.put(DBController());
  final _formKey = GlobalKey<FormState>();
  final double myWidth = 350;

  @override
  void initState() {
    setState(() {
      if (widget.snapshot != null) {
        _dbController.name.text = widget.snapshot!['Name'];
        _dbController.email.text = widget.snapshot!['EmailAddress'];
        _dbController.phone.text = widget.snapshot!['MobileNumber'].toString();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: CircleAvatar(
                          radius: 60,
                          child: Icon(Icons.save_as_outlined, size: 64))),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: ListTile(
                        title: Text('Save to Database',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFeatures: [FontFeature.swash()],
                                fontSize: 35)),
                        subtitle: Text(
                          'Saves data to Firestore Database',
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      width: myWidth,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                        controller: _dbController.name,
                        decoration: const InputDecoration(
                            labelText: 'Enter Name',
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.name,
                      )),
                  const SizedBox(height: 8),
                  SizedBox(
                      width: myWidth,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        controller: _dbController.email,
                        decoration: const InputDecoration(
                            labelText: 'Enter Email Address',
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.emailAddress,
                      )),
                  const SizedBox(height: 8),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      width: myWidth,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Number is required';
                          } else if (value.length != 10) {
                            return 'Invalid Number';
                          }
                          return null;
                        },
                        maxLength: 10,
                        controller: _dbController.phone,
                        decoration: const InputDecoration(
                            labelText: 'Enter Mobile Number',
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.phone,
                      )),
                  Container(
                      padding: const EdgeInsets.only(top: 16),
                      width: myWidth,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16)),
                          onPressed: () => setState(() {
                                if (_formKey.currentState!.validate()) {
                                  if (widget.snapshot != null) {
                                    _dbController.updateData(widget.snapshot
                                        as DocumentSnapshot<Object?>);
                                  } else {
                                    _dbController.addData();
                                  }
                                }
                              }),
                          icon: const Icon(Icons.arrow_forward_rounded),
                          label: widget.snapshot == null
                              ? const Text('Save')
                              : const Text('Update'))),
                ],
              ),
            ),
          ),
        ),
      );
}
