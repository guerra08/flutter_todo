import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/utils/task_filter.dart';

class TaskService {
  final CollectionReference _tasksRef =
      FirebaseFirestore.instance.collection('tasks');

  Future<DocumentReference> addNewTask(Task t) async {
    return await _tasksRef.add(t.toMap());
  }

  Future<void> markTaskAsDone(String uid) async {
    return _tasksRef.doc(uid).update({'isDone': true});
  }

  Stream<List<Task>> getTasksAsStream({
    TaskFilter filter = TaskFilter.all,
  }) {
    if (filter == TaskFilter.notDone) {
      return _tasksRef
          .where("isDone", isEqualTo: false)
          .snapshots()
          .map(_mapSnapshotToListOfTasks);
    } else if (filter == TaskFilter.done) {
      return _tasksRef
          .where("isDone", isEqualTo: true)
          .snapshots()
          .map(_mapSnapshotToListOfTasks);
    }
    return _tasksRef.snapshots().map(_mapSnapshotToListOfTasks);
  }

  List<Task> _mapSnapshotToListOfTasks(QuerySnapshot snapshot) {
    return snapshot.docs
        .map(
          (doc) => Task.fromMap(
            doc.data()! as Map<String, dynamic>,
            id: doc.id,
          ),
        )
        .toList();
  }
}
