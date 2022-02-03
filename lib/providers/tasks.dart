import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/providers/auth.dart';
import 'package:flutter_todo/services/task_service.dart';

final tasksServiceProvider = Provider<TaskService?>((ref) {
  final auth = ref.watch(authServiceProvider).authUser;

  if (auth != null) {
    return TaskService(userUid: auth.uid);
  }

  return null;
});
