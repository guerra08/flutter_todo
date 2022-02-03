import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/providers/tasks.dart';
import 'package:flutter_todo/widgets/task_tile.dart';

class TaskList extends ConsumerWidget {
  final List<Task> tasks;

  const TaskList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(tasksProvider);

    return ListView(
        children: tasks.map((Task task) {
      if (!task.isDone) {
        return Dismissible(
          key: Key(task.uid ?? task.hashCode.toString()),
          onDismissed: (direction) {
            provider.markTaskAsDone(task.uid!);
          },
          background: Container(
            color: Colors.green[400],
          ),
          child: TaskTile(
            title: task.title,
            description: task.description,
            isDone: false,
            onTrailingPressed: () {
              provider.deleteTask(task.uid!);
            },
          ),
        );
      }
      return TaskTile(
        title: task.title,
        description: task.description,
        isDone: true,
        onTrailingPressed: () {
          provider.deleteTask(task.uid!);
        },
      );
    }).toList());
  }
}
