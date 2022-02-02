import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();
  String? _title, _description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a task"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the title";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                _title = value;
              },
            ),
            TextFormField(
              onFieldSubmitted: (value) {
                _description = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  print("Submit");
                }
              },
              child: const Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
