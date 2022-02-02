import 'package:cloud_firestore/cloud_firestore.dart';
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
        child: StreamBuilder<QuerySnapshot>(
          stream: getIt.get<TaskService>().getNotDoneTasksAsStream(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            List<Task> tasks = snapshot.data!.docs.map((DocumentSnapshot doc) {
              Task t = Task.fromMap(doc.data()! as Map<String, dynamic>);
              t.uid = doc.id;
              return t;
            }).toList();

            return TaskList(
                tasks: tasks,
                onDismiss: getIt.get<TaskService>().markTaskAsDone);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getIt.get<TaskService>().addNewTask(Task(
                title: "New task",
                description: "Lorem ipsum",
                isDone: false,
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
