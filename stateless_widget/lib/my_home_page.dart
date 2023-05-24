import 'package:flutter/material.dart';

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black12,
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              'https://c4.wallpaperflare.com/wallpaper/965/883/624/manga-one-piece-wallpaper-preview.jpg',
              width: 500,
            ),
            const Divider(thickness: 5, color: Colors.black87),
            const Text('This is Loren Ipsum Image',
                style: TextStyle(fontSize: 50, color: Colors.black45))
          ],
        ));
  }
}
