import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
      ),
      body: Stack(children: const [
        Image(
            image: NetworkImage(
                'https://c4.wallpaperflare.com/wallpaper/974/565/254/windows-11-windows-10-minimalism-hd-wallpaper-preview.jpg')),
        Text(
          'Image description',
          style: TextStyle(fontSize: 50, color: Colors.white),
        )
      ]),
    ),
  ));
}
