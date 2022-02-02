import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/domain/models/task.dart';
import 'package:flutter_todo/presentation/widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final CollectionReference<Map<String, dynamic>> _tasksRef =
      FirebaseFirestore.instance.collection('tasks');

  Future<void> markAsDone(String uid) {
    return _tasksRef.doc(uid).update({'isDone': true});
  }

  Future<void> addNewTask() {
    Task toAdd = Task(
      title: "Hey, Johnny Park!",
      description: "A Song",
      isDone: false,
    );

    return _tasksRef.add(toAdd.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: _tasksRef.where("isDone", isEqualTo: false).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Task task =
                  Task.fromMap(document.data()! as Map<String, dynamic>);
              return Dismissible(
                key: Key(document.id),
                onDismissed: (direction) {
                  markAsDone(document.id);
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
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
