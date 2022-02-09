import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/utils/task_filter.dart';
import 'package:flutter_todo/extensions/firestore_ext.dart';

class TaskService {
  Future<DocumentReference<Object?>> addNewTask({
    required Task task,
    required String userUid,
  }) async {
    CollectionReference ref = FirebaseFirestore.instance.usersListRef(userUid);
    return await ref.add(
      task.toJson(),
    );
  }

  Future<void> markTaskAsDone({
    required String taskUid,
    required String userUid,
  }) async {
    CollectionReference ref = FirebaseFirestore.instance.usersListRef(userUid);
    return ref.doc(taskUid).update(
      {
        "isDone": true,
      },
    );
  }

  Stream<List<Task>> getTasksAsStream({
    TaskFilter filter = TaskFilter.all,
    required String userUid,
  }) {
    CollectionReference ref = FirebaseFirestore.instance.usersListRef(userUid);
    if (filter == TaskFilter.notDone) {
      return ref
          .where("isDone", isEqualTo: false)
          .snapshots()
          .map(_mapSnapshotToListOfTasks);
    } else if (filter == TaskFilter.done) {
      return ref
          .where("isDone", isEqualTo: true)
          .snapshots()
          .map(_mapSnapshotToListOfTasks);
    }
    return ref.snapshots().map(_mapSnapshotToListOfTasks);
  }

  Future<List<Task>> getTasks({
    TaskFilter filter = TaskFilter.all,
    required String userUid,
  }) async {
    CollectionReference ref = FirebaseFirestore.instance.usersListRef(userUid);
    QuerySnapshot querySnapshot;
    if (filter == TaskFilter.notDone) {
      querySnapshot = await ref.where("isDone", isEqualTo: false).get();
    } else if (filter == TaskFilter.done) {
      querySnapshot = await ref.where("isDone", isEqualTo: true).get();
    } else {
      querySnapshot = await ref.get();
    }
    return querySnapshot.docs.map(_mapQuerySnapshotToTask).toList();
  }

  Future<void> deleteTask({
    required String taskUid,
    required String userUid,
  }) {
    CollectionReference ref = FirebaseFirestore.instance.usersListRef(userUid);
    return ref.doc(taskUid).delete();
  }

  List<Task> _mapSnapshotToListOfTasks(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Task t = Task.fromJson(
        doc.data()! as Map<String, dynamic>,
      );
      return t.copyWith(uid: doc.id);
    }).toList();
  }

  Task _mapQuerySnapshotToTask(QueryDocumentSnapshot docSnapshot) {
    Task t = Task.fromJson(
      docSnapshot.data()! as Map<String, dynamic>,
    );
    return t.copyWith(uid: docSnapshot.id);
  }
}
