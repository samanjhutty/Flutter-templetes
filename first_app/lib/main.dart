import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Row(
    textDirection: TextDirection.ltr,
    children: [
      const Expanded(
          child: Text(
        "Hello row!",
        style: TextStyle(fontStyle: FontStyle.italic),
        textDirection: TextDirection.ltr,
      )),
      const Expanded(
          child: Text(
        "Hello row 1!",
        style: TextStyle(fontStyle: FontStyle.italic),
        textDirection: TextDirection.ltr,
      )),
      Center(
        child: Container(
          height: 500,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: const [
              Expanded(
                  child: Text(
                "Hello column!",
                textDirection: TextDirection.ltr,
              )),
              Expanded(
                  child: Text(
                "Hello column 1!",
                textDirection: TextDirection.ltr,
              ))
            ],
          ),
        ),
      )
    ],
  ));
}
