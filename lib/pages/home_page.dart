import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/providers/auth_provider.dart';
import 'package:flutter_todo/providers/task_provider.dart';
import 'package:flutter_todo/utils/task_filter.dart';
import 'package:flutter_todo/widgets/filter_task_popup.dart';
import 'package:flutter_todo/widgets/task_list.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _selectedFilter = ref.watch(taskFilterProvider);
    final _tasks = ref.watch(taskControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Row(
            children: [
              Text(_selectedFilter.label),
              FilterTaskPopup(
                onOptionSelected: (TaskFilter option) {
                  ref.read(taskFilterProvider.notifier).state = option;
                  ref.read(taskControllerProvider.notifier).getTasks();
                },
              ),
            ],
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await ref.read(authControllerProvider.notifier).signOut();
          },
        ),
      ),
      body: Center(
        child: _tasks.when(
          data: (tasks) {
            if (tasks.isNotEmpty) {
              return TaskList(tasks: tasks);
            }
            return const Text(
                "This seems a little empty... Feel free to add a new task!");
          },
          error: (_, st) {
            return const Text("Error :(");
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go("/create");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
