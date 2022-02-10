import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/providers/task_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CreatePage extends HookConsumerWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final title = useState("");
    final description = useState("");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a task"),
      ),
      body: Form(
        key: formKey.value,
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
                  title.value = value ?? "";
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
                  description.value = value ?? "";
                },
                onFieldSubmitted: (_) async {
                  if (formKey.value.currentState!.validate()) {
                    formKey.value.currentState?.save();
                    await ref.read(taskControllerProvider.notifier).addTask(
                          Task(
                              title: title.value,
                              description: description.value,
                              isDone: false),
                        );
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
