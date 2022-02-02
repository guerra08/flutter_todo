import 'package:flutter_todo/service/task_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupGetIt() {
  locator.registerSingleton<TaskService>(TaskService());
}
