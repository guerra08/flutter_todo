import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/controllers/task_controller.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/providers/auth_provider.dart';
import 'package:flutter_todo/services/task_service.dart';
import 'package:flutter_todo/utils/task_filter.dart';

final taskFilterProvider = StateProvider<TaskFilter>((_) => TaskFilter.all);

final taskServiceProvider = Provider<TaskService>((_) => TaskService());

final taskControllerProvider =
    StateNotifierProvider<TaskController, AsyncValue<List<Task>>>(
  (ref) {
    final authState = ref.watch(authControllerProvider);
    final taskFilterState = ref.watch(taskFilterProvider);
    return TaskController(ref.read, taskFilterState, authState);
  },
);
