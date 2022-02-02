import 'package:flutter_todo/service/task_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<TaskService>(TaskService());
}
