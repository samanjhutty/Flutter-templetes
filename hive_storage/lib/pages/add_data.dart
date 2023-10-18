import 'package:flutter/material.dart';
import 'package:hive_storage/main.dart';
import 'package:hive_storage/model/boxes.dart';
import '../model/data_model.dart';

class AddData extends StatefulWidget {
  AddData({super.key, this.name, this.score, this.index});

  String? name = '';
  String? score = '';
  int? index;

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController scoreController = TextEditingController();
  double myWidth = 350;

  @override
  void initState() {
    if (widget.index != null) {
      nameController.text = widget.name!;
      scoreController.text = widget.score!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: myWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                Text('Save Data',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: scheme.primary)),
                const SizedBox(height: 16),
                const Text(
                    'Hive allows user to save data locally on their device.',
                    textAlign: TextAlign.center),
                const SizedBox(height: 16),
              ]),
              Column(children: [
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                      label: Text('Enter Name'), border: OutlineInputBorder()),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: scoreController,
                  decoration: const InputDecoration(
                      label: Text('Enter Score'), border: OutlineInputBorder()),
                ),
                const SizedBox(height: 30),
              ]),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20)),
                          onPressed: () {
                            widget.index != null
                                ? dbBox.putAt(
                                    widget.index!,
                                    DataModel(
                                        name: nameController.text.trim(),
                                        score: double.parse(
                                            scoreController.text.trim())))
                                : dbBox.add(DataModel(
                                    name: nameController.text.trim(),
                                    score: double.parse(
                                        scoreController.text.trim())));

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Material(child: MyHomePage())),
                                (route) => route.isCurrent);
                          },
                          child: const Text('Save'))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: scheme.primary,
                              foregroundColor: scheme.onPrimary,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20)),
                          onPressed: () {
                            nameController.clear();
                            scoreController.clear();
                          },
                          child: const Text('Reset'))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
