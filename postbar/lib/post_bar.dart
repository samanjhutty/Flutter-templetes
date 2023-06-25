import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Postbar extends StatefulWidget {
  const Postbar({super.key});

  @override
  _PostbarState createState() => _PostbarState();
}

class _PostbarState extends State<Postbar> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg')),
      Expanded(
          child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 32, 0),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: TextButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 8, vertical: 16)),
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    alignment: Alignment.centerLeft,
                    foregroundColor: MaterialStatePropertyAll(Colors.black87)),
                onPressed: () {},
                child: const Text(
                  'Whats on your mind?..',
                ),
              ))),
      Container(
        margin: const EdgeInsets.only(right: 8),
        child: IconButton(
            onPressed: () {},
            hoverColor: Colors.transparent,
            icon: const Icon(Icons.photo_library)),
      ),
    ]);
  }
}
