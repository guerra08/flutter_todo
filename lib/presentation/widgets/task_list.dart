import 'package:flutter/material.dart';
import 'package:flutter_todo/domain/models/task.dart';
import 'package:flutter_todo/presentation/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function onDismiss;

  const TaskList({Key? key, required this.tasks, required this.onDismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: tasks.map((Task task) {
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
        ),
      );
    }).toList());
  }
}
