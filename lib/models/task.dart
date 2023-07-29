import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.title,
    this.isDeleted,
    this.isDone,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    bool? isDeleted,
    bool? isDone,
  }) {
    return Task(
      title: title ?? this.title,
      isDeleted: isDeleted ?? this.isDeleted,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDelted': isDeleted,
      'isDone': isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      isDeleted: map['isDeleted'],
      isDone: map['isDone'],
    );
  }

  @override
  List<Object?> get props => [
        title,
        isDeleted,
        isDone,
      ];
}
