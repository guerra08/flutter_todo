import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/task_filter.dart';

class FilterTaskPopup extends StatelessWidget {
  final Function onOptionSelected;

  const FilterTaskPopup({
    Key? key,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        onOptionSelected(value);
      },
      itemBuilder: (context) => <PopupMenuEntry<TaskFilter>>[
        const PopupMenuItem<TaskFilter>(
          value: TaskFilter.all,
          child: Text("All"),
        ),
        const PopupMenuItem<TaskFilter>(
          value: TaskFilter.done,
          child: Text("Done"),
        ),
        const PopupMenuItem<TaskFilter>(
          value: TaskFilter.notDone,
          child: Text("Pending"),
        ),
      ],
    );
  }
}
