import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/utils/task_filter.dart';

class TaskService {
  final taskSubcollection = "tasks";
  late CollectionReference _ref;

  TaskService({required String userUid}) {
    _ref = FirebaseFirestore.instance
        .collection("users")
        .doc(userUid)
        .collection("tasks");
  }

  Future<DocumentReference<Object?>> addNewTask(
    Task t,
  ) async {
    return await _ref.add(
      t.toMap(),
    );
  }

  Future<void> markTaskAsDone(String uid) async {
    return _ref.doc(uid).update(
      {
        "isDone": true,
      },
    );
  }

  Stream<List<Task>> getTasksAsStream({
    TaskFilter filter = TaskFilter.all,
  }) {
    if (filter == TaskFilter.notDone) {
      return _ref
          .where("isDone", isEqualTo: false)
          .snapshots()
          .map(_mapSnapshotToListOfTasks);
    } else if (filter == TaskFilter.done) {
      return _ref
          .where("isDone", isEqualTo: true)
          .snapshots()
          .map(_mapSnapshotToListOfTasks);
    }
    return _ref.snapshots().map(_mapSnapshotToListOfTasks);
  }

  Future<void> deleteTask(String uid) {
    return _ref.doc(uid).delete();
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
