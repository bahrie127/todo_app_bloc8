import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String task;
  final String desc;
  bool? isCompleted;
  bool? isCancelled;

  Todo({
    required this.id,
    required this.task,
    required this.desc,
    this.isCancelled,
    this.isCompleted,
  }) {
    isCancelled = isCancelled ?? false;
    isCompleted = isCompleted ?? false;
  }

  Todo copyWith({
    String? id,
    String? task,
    String? desc,
    bool? isCompleted,
    bool? isCancelled,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      desc: desc ?? this.desc,
      isCancelled: isCancelled ?? this.isCancelled,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        id,
        task,
        desc,
        isCompleted,
        isCancelled,
      ];
}

List<Todo> todos = [
  Todo(
    id: '1',
    task: 'task1',
    desc: 'desc1',
  ),
  Todo(
    id: '2',
    task: 'task2',
    desc: 'desc2',
  ),
];
