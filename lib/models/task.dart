class Task {
  String? uid;
  String title;
  String description;
  bool isDone;

  Task({
    this.uid,
    required this.title,
    required this.description,
    required this.isDone,
  });

  Map<String, dynamic> toMap({bool withUid = false}) {
    final map = {
      'uid': uid,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
    if (withUid) map['uid'] = uid;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map, {required String id}) {
    return Task(
      uid: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  @override
  String toString() {
    return 'Task(uid: $uid, title: $title, description: $description, isDone: $isDone)';
  }
}
