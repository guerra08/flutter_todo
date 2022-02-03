import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/service/task_service.dart';

final tasksProvider = Provider((ref) => TaskService());
