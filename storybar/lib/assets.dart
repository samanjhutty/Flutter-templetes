import 'package:flutter/material.dart';

showSnackBar(String data, context, int time) {
  var snackBar =
      SnackBar(content: Text(data), duration: Duration(milliseconds: time));
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
