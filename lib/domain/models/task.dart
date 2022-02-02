import 'dart:convert';

class Task {
  String title;
  String description;
  bool isDone;

  Task({
    required this.title,
    required this.description,
    required this.isDone,
  });

  Task copyWith({
    String? title,
    String? description,
    bool? isDone,
  }) {
    return Task(
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

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() =>
      'Task(title: $title, description: $description, isDone: $isDone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.title == title &&
        other.description == description &&
        other.isDone == isDone;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ isDone.hashCode;
}
