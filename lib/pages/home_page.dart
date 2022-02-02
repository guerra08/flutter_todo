import 'package:flutter/material.dart';
import 'package:flutter_todo/models/get_it_setup.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/service/task_service.dart';
import 'package:flutter_todo/widgets/task_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: getIt.get<TaskService>().getNotDoneTasksAsStream(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Task>> snapshot,
          ) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return TaskList(
              tasks: snapshot.data!,
              onDismiss: getIt.get<TaskService>().markTaskAsDone,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getIt.get<TaskService>().addNewTask(
                Task(
                  title: "New task",
                  description: "Lorem ipsum",
                  isDone: false,
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
