import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWidgets extends ChangeNotifier {
  defaultSubmitBtn({String title = 'Next'}) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(title),
        const SizedBox(width: 8),
        const Icon(Icons.arrow_forward_rounded)
      ]);

  myAnimation({String title = 'Next', bool progress = false}) {
    Widget btn = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(title),
      const SizedBox(width: 8),
      progress == false
          ? const Icon(Icons.arrow_forward_rounded)
          : const SizedBox(
              height: 24, width: 24, child: CircularProgressIndicator())
    ]);
    notifyListeners();
    return btn;
  }

  mySnackbar(String text) async {
    Get.closeAllSnackbars();
    Get.rawSnackbar(message: text);
  }
}
