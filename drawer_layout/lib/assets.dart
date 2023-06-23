import 'package:flutter/material.dart';

gotoPage(pageContext, Widget page) => Material(
        child: Stack(children: [
      Container(
          padding: const EdgeInsets.all(24),
          child: IconButton(
            onPressed: () {
              Navigator.pop(pageContext);
            },
            icon: const Icon(Icons.close),
            tooltip: 'Close',
          )),
      page
    ]));

void showSnackBarAsBottomSheet(BuildContext context, String message) {
  showModalBottomSheet<void>(
    context: context,
    barrierColor: const Color.fromRGBO(0, 0, 0, 0),
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pop(context);
      });
      return Container(
          padding: const EdgeInsets.all(12),
          child: Wrap(children: [Text(message)]));
    },
  );
}
