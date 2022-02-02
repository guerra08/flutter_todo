import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String description;

  const TaskTile({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(title),
    );
  }
}
