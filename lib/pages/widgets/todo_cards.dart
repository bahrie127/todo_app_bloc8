import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc8/todosbloc/todos_bloc.dart';
import 'package:todo_app_bloc8/model/todo_model.dart';
import 'package:todo_app_bloc8/theme.dart';

Card todoCard(BuildContext context, Todo todo) {
  return Card(
    margin: const EdgeInsets.all(8.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '#${todo.id}: ${todo.task}',
            style: primary,
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  context.read<TodosBloc>().add(
                        UpdateTodo(
                          todo: todo.copyWith(isCompleted: true),
                        ),
                      );
                },
                icon: const Icon(Icons.add_task),
              ),
              IconButton(
                onPressed: () {
                  context.read<TodosBloc>().add(DeleteTodo(todo: todo));
                },
                icon: const Icon(Icons.cancel),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
