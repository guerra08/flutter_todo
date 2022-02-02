import 'package:flutter/material.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function onDismiss;
  final void Function(String) onDeletePressed;

  const TaskList({
    Key? key,
    required this.tasks,
    required this.onDismiss,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: tasks.map((Task task) {
      if (!task.isDone) {
        return Dismissible(
          key: Key(task.uid ?? task.hashCode.toString()),
          onDismissed: (direction) {
            onDismiss(task.uid);
          },
          background: Container(
            color: Colors.green[400],
          ),
          child: TaskTile(
            title: task.title,
            description: task.description,
            isDone: false,
            onTrailingPressed: () {
              onDeletePressed(task.uid!);
            },
          ),
        );
      }
      return TaskTile(
        title: task.title,
        description: task.description,
        isDone: true,
        onTrailingPressed: () {
          onDeletePressed(task.uid!);
        },
      );
    }).toList());
  }
}
