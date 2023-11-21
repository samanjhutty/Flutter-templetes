import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic UI Design',
          textDirection: TextDirection.ltr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              Text(
                "Welcome to Material UI",
                style: TextStyle(fontSize: 30, color: Colors.black26),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                textWidthBasis: TextWidthBasis.parent,
              ),
              Image(
                image: AssetImage('assets/background/ig_background.jpg'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomLeft,
                width: 500,
              ),
              Image(
                image: NetworkImage(
                    'https://images.firstpost.com/wp-content/uploads/2019/05/Grand-Theft-Auto-poster.jpg'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomLeft,
                width: 500,
              )
            ],
          )),
    )),
  );
}
