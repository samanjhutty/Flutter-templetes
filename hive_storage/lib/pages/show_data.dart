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
        : ListView.builder(
            itemCount: dbBox.length,
            itemBuilder: (context, index) => Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                        onPressed: (value) {
                          dbBox.deleteAt(index);
                        },
                        icon: Icons.delete,
                        label: 'Delete')
                  ],
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(dbBox.get(index)!.name),
                        Text(dbBox.get(index)!.score.toString())
                      ],
                    ),
                  ),
                )));
  }
}
