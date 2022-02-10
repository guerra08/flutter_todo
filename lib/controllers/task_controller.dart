import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/models/auth_state.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/providers/task_provider.dart';
import 'package:flutter_todo/utils/task_filter.dart';

class TaskController extends StateNotifier<AsyncValue<List<Task>>> {
  final Reader _read;
  final TaskFilter _taskFilter;
  String? _userUid;

  TaskController(this._read, this._taskFilter, AuthState authState)
      : super(const AsyncValue.loading()) {
    authState.when(
        unauthorized: () {},
        authorized: (user) {
          _userUid = user.uid;
          getTasks();
        },
        loading: () {});
  }

  Future<void> getTasks() async {
    state = const AsyncValue.loading();
    final tasks = await _read(taskServiceProvider)
        .getTasks(userUid: _userUid!, filter: _taskFilter);
    state = AsyncValue.data(tasks);
  }

  Future<void> addTask(Task task) async {
    final taskId = (await _read(taskServiceProvider)
            .addNewTask(task: task, userUid: _userUid!))
        .id;
    Task newTask = task.copyWith(uid: taskId);
    state.whenData((tasks) => state = AsyncValue.data(tasks..add(newTask)));
  }

  Future<void> completeTask({required String taskUid}) async {
    await _read(taskServiceProvider)
        .markTaskAsDone(taskUid: taskUid, userUid: _userUid!);
    state.whenData((tasks) {
      state = AsyncValue.data([
        for (final task in tasks)
          if (task.uid == taskUid) task.copyWith(isDone: true) else task
      ]);
    });
  }

  Future<void> deleteTask({required String taskUid}) async {
    await _read(taskServiceProvider).deleteTask(
      taskUid: taskUid,
      userUid: _userUid!,
    );
    state.whenData((tasks) => state =
        AsyncValue.data(tasks..removeWhere((task) => task.uid == taskUid)));
  }
}
