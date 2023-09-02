import 'dart:ui';

import 'package:employee_attedence_clone/main.dart';
import 'package:flutter/material.dart';

class Templates extends StatefulWidget {
  const Templates({super.key});

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Templates> {
  bool? isApplied = false;
  @override
  Widget build(BuildContext context) => Column(children: [
        AppBar(
            backgroundColor: Colors.grey[850],
            foregroundColor: Colors.white,
            elevation: 0,
            title: const Text('Create Templates',
                style: TextStyle(fontFeatures: [FontFeature.swash()]))),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextField(
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                        labelStyle: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 2)),
                        border: const OutlineInputBorder(),
                        labelText: 'Template Name',
                        hintText: 'Enter Template Name'))),
            Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Basic',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16)),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Icons.percent_rounded, size: 20),
                              ),
                              labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: primaryColor, width: 2)),
                              border: const OutlineInputBorder(),
                              labelText: 'Basic'),
                        ),
                      ))
                    ])),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('HRA',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600))),
            Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.percent,
                                      size: 20,
                                      color: Colors.grey,
                                    )),
                                Icon(Icons.delete_outline_rounded,
                                    size: 20, color: Colors.red[800])
                              ])),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primaryColor, width: 2)),
                      border: const OutlineInputBorder(),
                    ))),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('Meal Allowance',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600))),
            Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.percent,
                                      size: 20,
                                      color: Colors.grey,
                                    )),
                                Icon(Icons.delete_outline_rounded,
                                    size: 20, color: Colors.red[800])
                              ])),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: primaryColor, width: 2)),
                      border: const OutlineInputBorder(),
                    ))),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        foregroundColor: primaryColorDark,
                        backgroundColor: Colors.teal[50]),
                    child: const Text('Add Allowences'))),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('Employee Contribution',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Divider()))
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(children: [
                  const Text(
                    'Empoyer PF',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14)),
                        onPressed: () {},
                        child: Column(children: [
                          Text(
                            '1800 Limit',
                            style: TextStyle(color: primaryColorDark),
                          ),
                          Text('on Basic',
                              style: TextStyle(
                                  fontSize: 12, color: primaryColorDark))
                        ])),
                  ))
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(children: [
                  const Text(
                    'Empoyer ESI',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14)),
                        onPressed: () {},
                        child: Column(children: [
                          Text(
                            '3.25% Variable',
                            style: TextStyle(color: primaryColorDark),
                          ),
                          Text('on Basic',
                              style: TextStyle(
                                  fontSize: 12, color: primaryColorDark))
                        ])),
                  ))
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(children: [
                  DefaultTextStyle(
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.grey[900]),
                      child: const Column(children: [
                        Text('PF EDLI'),
                        Text('& Admin'),
                        Text('Charges')
                      ])),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Row(children: [
                      Checkbox(
                          fillColor: MaterialStatePropertyAll(primaryColor),
                          onChanged: (value) => setState(() {
                                isApplied = value;
                              }),
                          value: isApplied),
                      const Text('Applied', style: TextStyle(fontSize: 14))
                    ]),
                  ))
                ])),
          ]),
        )),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        foregroundColor: Colors.grey[700],
                        backgroundColor: primaryColor),
                    onPressed: () {},
                    child: const Text('Create Template')),
              ),
            ],
          ),
        )
      ]);
}
