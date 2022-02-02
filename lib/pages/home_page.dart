import 'package:flutter/material.dart';
import 'package:flutter_todo/locator/locator.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/service/task_service.dart';
import 'package:flutter_todo/utils/task_filter.dart';
import 'package:flutter_todo/widgets/filter_task_popup.dart';
import 'package:flutter_todo/widgets/task_list.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  TaskFilter _selectedFilter = TaskFilter.notDone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          FilterTaskPopup(
            onOptionSelected: (TaskFilter option) {
              setState(() {
                _selectedFilter = option;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: locator
              .get<TaskService>()
              .getTasksAsStream(filter: _selectedFilter),
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
                  "All done! Feel free to add a new task!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            return TaskList(
              tasks: snapshot.data!,
              onDismiss: locator.get<TaskService>().markTaskAsDone,
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
  }
}
