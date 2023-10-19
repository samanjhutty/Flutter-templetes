import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_storage/model/boxes.dart';
import 'package:hive_storage/pages/add_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

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
                            flex: 2,
                            child: Text('S. no',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                              flex: 5,
                              child: Text('Name',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                              flex: 3,
                              child: Text('Score',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(child: SizedBox())
                        ]),
                  ),
                ),
                Card(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dbBox.length,
                      itemBuilder: (context, index) => Slidable(
                          endActionPane: ActionPane(
                            extentRatio: 0.3,
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                  backgroundColor: scheme.secondary,
                                  foregroundColor: scheme.onSecondary,
                                  borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(12)),
                                  onPressed: (context) => setState(() {
                                        dbBox.deleteAt(index);
                                      }),
                                  label: 'Delete')
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Material(
                                              child: AddData(
                                            name: dbBox.get(index)?.name,
                                            score: dbBox.get(index)?.score,
                                            index: index,
                                          )))),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text('${index + 1}.',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child:
                                            Text('${dbBox.get(index)?.name}')),
                                    Expanded(
                                        flex: 3,
                                        child:
                                            Text('${dbBox.get(index)?.score}')),
                                    const Expanded(
                                      child: Icon(Icons.arrow_back_ios_rounded,
                                          size: 14),
                                    )
                                  ]),
                            ),
                          ))),
                ),
              ],
            ),
          );
  }
}
