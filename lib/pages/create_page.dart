import 'package:flutter/material.dart';
import 'package:flutter_todo/locator/locator.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/service/task_service.dart';
import 'package:go_router/go_router.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();
  String? _title, _description;

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      await locator.get<TaskService>().addNewTask(
          Task(title: _title!, description: _description ?? "", isDone: false));
      GoRouter.of(context).pop();
    }
  }

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Task title",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the title";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _title = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Task description",
                ),
                textInputAction: TextInputAction.done,
                onSaved: (value) {
                  _description = value;
                },
                onFieldSubmitted: (_) {
                  submitForm();
                },
              ),
            ),
            ElevatedButton(
              onPressed: submitForm,
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
