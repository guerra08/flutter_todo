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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  await locator.get<TaskService>().addNewTask(Task(
                      title: _title!,
                      description: _description ?? "",
                      isDone: false));
                  GoRouter.of(context).pop();
                }
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
