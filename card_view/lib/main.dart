import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text('Cardview'),
    ),
    body: Center(
        child: SizedBox(
            width: 500,
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Image.network(
                  'https://www.shutterstock.com/image-photo/portrait-mature-man-camp-on-600w-1954592398.jpg',
                  width: 500,
                ),
                const Divider(thickness: 5),
                const Text('Image', style: TextStyle(fontSize: 20))
              ]),
            ))),
  )));
}
