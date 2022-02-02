import 'dart:convert';

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

  Task copyWith({
    String? uid,
    String? title,
    String? description,
    bool? isDone,
  }) {
    return Task(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
    };
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.uid == uid &&
        other.title == title &&
        other.description == description &&
        other.isDone == isDone;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        title.hashCode ^
        description.hashCode ^
        isDone.hashCode;
  }
}
