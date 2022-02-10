import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/providers/task_provider.dart';
import 'package:flutter_todo/widgets/task_tile.dart';

class TaskList extends ConsumerWidget {
  final List<Task> tasks;

  const TaskList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
        children: tasks.map((Task task) {
      if (!task.isDone) {
        return Dismissible(
          key: Key(task.uid ?? task.hashCode.toString()),
          onDismissed: (direction) {
            ref
                .read(taskControllerProvider.notifier)
                .completeTask(taskUid: task.uid!);
          },
          background: Container(
            color: Colors.green[400],
          ),
          child: TaskTile(
            title: task.title,
            description: task.description,
            isDone: false,
            onTrailingPressed: () {
              ref
                  .read(taskControllerProvider.notifier)
                  .deleteTask(taskUid: task.uid!);
            },
          ),
        );
      }
      return TaskTile(
        title: task.title,
        description: task.description,
        isDone: true,
        onTrailingPressed: () {
          ref
              .read(taskControllerProvider.notifier)
              .deleteTask(taskUid: task.uid!);
        },
      );
    }).toList());
  }
}
