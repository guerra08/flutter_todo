import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String description;
  final bool isDone;
  final VoidCallback onTrailingPressed;

  const TaskTile({
    Key? key,
    required this.title,
    required this.description,
    required this.isDone,
    required this.onTrailingPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: isDone
            ? const TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationThickness: 2,
              )
            : null,
      ),
      subtitle: Text(
        description,
        style: isDone
            ? const TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationThickness: 1,
              )
            : null,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onTrailingPressed,
      ),
    );
  }
}
