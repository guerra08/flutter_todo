import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/models/task.dart';

class TaskService {
  final CollectionReference _tasksRef =
      FirebaseFirestore.instance.collection('tasks');

  Future<DocumentReference> addNewTask(Task t) async {
    return await _tasksRef.add(t.toMap());
  }

  Future<void> markTaskAsDone(String uid) async {
    return _tasksRef.doc(uid).update({'isDone': true});
  }

  Stream<QuerySnapshot> getNotDoneTasksAsStream() {
    return _tasksRef.where("isDone", isEqualTo: false).snapshots();
  }
}
