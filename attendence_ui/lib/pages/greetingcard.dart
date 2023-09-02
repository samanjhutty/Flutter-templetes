import 'dart:ui';
import 'package:employee_attedence_clone/main.dart';
import 'package:employee_attedence_clone/model/greeting_model.dart';
import 'package:flutter/material.dart';

class GreetingCard extends StatefulWidget {
  const GreetingCard({super.key});

  @override
  _GreetingCardState createState() => _GreetingCardState();
}

class _GreetingCardState extends State<GreetingCard> {
  @override
  Widget build(BuildContext context) => Column(children: [
        AppBar(
            backgroundColor: Colors.grey[50],
            foregroundColor: Colors.black87,
            elevation: 0,
            title: const Text('Greeting Card')),
        Expanded(
            child: ListView.builder(
          itemCount: cardData.length,
          itemBuilder: (context, i) => Column(children: [
            SizedBox(
              height: 240,
              child: Row(children: [
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: Card(
                        elevation: 8,
                        child: Image.asset(cardData[i].cardImage,
                            height: double.infinity,
                            width: MediaQuery.of(context).size.width * 0.45,
                            fit: BoxFit.cover))),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 12),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cardData[i].text,
                            style: TextStyle(
                                fontFeatures: const [FontFeature.swash()],
                                color: Colors.grey[700])),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(children: [
                                Expanded(
                                  child: TextButton.icon(
                                      style: TextButton.styleFrom(
                                          foregroundColor: Colors.black54,
                                          padding: const EdgeInsets.all(12),
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: Colors.black54),
                                              borderRadius:
                                                  BorderRadius.circular(30))),
                                      onPressed: cardData[i].editTap,
                                      icon: const Icon(Icons.edit),
                                      label: const Text('Edit')),
                                )
                              ]),
                            ),
                            Row(children: [
                              Expanded(
                                child: TextButton.icon(
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(12),
                                        backgroundColor: primaryColor,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    onPressed: () {
                                      // this.widget.debugFillProperties();
                                    },
                                    icon: const Icon(Icons.share),
                                    label: const Text('Share')),
                              )
                            ])
                          ],
                        ),
                      ]),
                ))
              ]),
            ),
            const Divider(thickness: 10)
          ]),
        ))
      ]);
}
