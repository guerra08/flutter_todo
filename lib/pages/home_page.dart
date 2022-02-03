import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/providers/auth.dart';
import 'package:flutter_todo/providers/tasks.dart';
import 'package:flutter_todo/widgets/task_list.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authService = ref.read(authServiceProvider);
    final _tasksService = ref.read(tasksProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await _authService.signOut();
          },
        ),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _tasksService.getTasksAsStream(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Task>> snapshot,
          ) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (!snapshot.hasData ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  "This feels a little empty... Feel free to add a new task!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            return TaskList(tasks: snapshot.data!);
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
