import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/providers/auth.dart';
import 'package:flutter_todo/services/task_service.dart';

final tasksServiceProvider = Provider<TaskService?>((ref) {
  final authState = ref.watch(authNotifierProvider);

  return authState.when(
      unauthorized: () => null,
      authorized: (user) => TaskService(userUid: user.uid),
      loading: () => null);
});
