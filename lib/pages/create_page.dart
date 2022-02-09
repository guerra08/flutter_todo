import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/providers/tasks.dart';
import 'package:go_router/go_router.dart';

class CreatePage extends ConsumerStatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreatePageState();
}

class _CreatePageState extends ConsumerState<CreatePage> {
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
                onFieldSubmitted: (_) async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    await ref.read(taskControllerProvider.notifier).addTask(
                        Task(
                            title: _title!,
                            description: _description ?? "",
                            isDone: false));
                    GoRouter.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
