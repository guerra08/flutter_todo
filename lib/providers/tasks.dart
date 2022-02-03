import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/services/task_service.dart';

final tasksProvider = Provider((ref) => TaskService());
