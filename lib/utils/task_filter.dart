enum TaskFilter { all, done, notDone }

extension TaskFilterExtension on TaskFilter {
  String get label {
    switch (this) {
      case TaskFilter.all:
        return "All";
      case TaskFilter.done:
        return "Done";
      case TaskFilter.notDone:
        return "Pending";
      default:
        return "";
    }
  }
}
