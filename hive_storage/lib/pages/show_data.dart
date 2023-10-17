import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_storage/model/boxes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return dbBox.isEmpty
        ? const Center(
            child: Text(
            'Click the + icon to add data.',
            style: TextStyle(color: Colors.grey),
          ))
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Text('S. no',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                              flex: 4,
                              child: Text('Name',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              flex: 2,
                              child: Text('Score',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ]),
                  ),
                ),
                Card(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dbBox.length,
                      itemBuilder: (context, index) => Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                  onPressed: (context) => setState(() {
                                        dbBox.deleteAt(index);
                                      }),
                                  icon: Icons.delete,
                                  label: 'Delete')
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text('${index + 1}.',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Text(dbBox.get(index)!.name)),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                        dbBox.get(index)!.score.toString()))
                              ],
                            ),
                          ))),
                ),
              ],
            ),
          );
  }
}
