import 'package:flutter/material.dart';

class MyMenuBars extends StatefulWidget {
  const MyMenuBars({super.key});

  @override
  MenuBarsState createState() => MenuBarsState();
}

class MenuBarsState extends State<MyMenuBars> {
  @override
  Widget build(BuildContext context) {
    return Wrap(alignment: WrapAlignment.spaceEvenly, children: [
      TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {},
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: const [Icon(Icons.post_add), Text('Text')],
          )),
      const SizedBox(height: 20, child: VerticalDivider(thickness: 1)),
      TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {},
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: const [Icon(Icons.video_call), Text('Live Video')],
          )),
      const SizedBox(height: 20, child: VerticalDivider(thickness: 1)),
      TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {},
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: const [Icon(Icons.location_on), Text('Location')],
          )),
    ]);
  }
}
