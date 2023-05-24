import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
      ),
      body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 30,
          crossAxisSpacing: 20,
          children: const [
            Image(
                image: NetworkImage(
                    'https://cdn2.outdoorphotographer.com/2023/05/Sandhill-Silhouettes-By-Garry-Everett-.jpeg')),
            Image(
                image: NetworkImage(
                    'https://cdn2.outdoorphotographer.com/2023/05/The-Wanderer-By-Max-Foster.jpeg')),
            Image(
                image: NetworkImage(
                    'https://cdn2.outdoorphotographer.com/2023/05/Farewell-to-the-Kings-Robert-Henderson.jpeg')),
            Image(
                image: NetworkImage(
                    'https://cdn2.outdoorphotographer.com/2023/05/The-Wanderer-By-Max-Foster.jpeg')),
            Image(
                image: NetworkImage(
                    'https://cdn2.outdoorphotographer.com/2023/05/Farewell-to-the-Kings-Robert-Henderson.jpeg')),
            Image(
                image: NetworkImage(
                    'https://cdn2.outdoorphotographer.com/2023/05/Sandhill-Silhouettes-By-Garry-Everett-.jpeg')),
          ]),
    ),
  ));
}
