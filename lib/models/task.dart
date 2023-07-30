import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.title,
    required this.description,
    required this.id,
    this.isDeleted,
    this.isDone,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    bool? isDeleted,
    bool? isDone,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'id': id,
      'isDelted': isDeleted,
      'isDone': isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      isDeleted: map['isDeleted'],
      isDone: map['isDone'],
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
        isDeleted,
        isDone,
      ];
}
