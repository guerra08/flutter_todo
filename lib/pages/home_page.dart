import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/providers/auth.dart';
import 'package:flutter_todo/providers/tasks.dart';
import 'package:flutter_todo/widgets/task_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final tasks = ref.watch(tasksProvider);

    return user.when(
      data: (user) {
        return Scaffold(
          appBar: AppBar(
              title: Text(title),
              leading: user != null
                  ? IconButton(
                      onPressed: () async {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: const Icon(Icons.logout),
                    )
                  : null),
          body: Center(
            child: (user == null)
                ? TextButton.icon(
                    onPressed: () async {
                      await signInWithGoogle();
                    },
                    icon: const FaIcon(FontAwesomeIcons.google),
                    label: const Text("Sign in with Google"),
                  )
                : StreamBuilder(
                    stream: tasks.getTasksAsStream(),
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

                      return TaskList(
                        tasks: snapshot.data!,
                        onDismiss: tasks.markTaskAsDone,
                        onDeletePressed: tasks.deleteTask,
                      );
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
      },
      error: (e, s) => const Text('error'),
      loading: () => const Text('loading'),
    );
  }
}
