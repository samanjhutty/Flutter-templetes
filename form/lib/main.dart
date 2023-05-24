import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Form')),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SizedBox(
              width: 300,
              child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Input Text'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is Required';
                        }
                      }),
                  const Divider(height: 50, color: Colors.transparent),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          const snackBar =
                              SnackBar(content: Text('Button Clicked'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text('Submit'))
                ]),
              ),
            )));
  }
}
