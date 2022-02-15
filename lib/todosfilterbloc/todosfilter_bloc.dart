import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc8/model/todo_model.dart';
import 'package:todo_app_bloc8/model/todosfilter_model.dart';

import '../todosbloc/todos_bloc.dart';

part 'todosfilter_event.dart';
part 'todosfilter_state.dart';

class TodosfilterBloc extends Bloc<TodosfilterEvent, TodosfilterState> {
  final TodosBloc _todosBloc;
  late StreamSubscription _todosSubscription;
  TodosfilterBloc({required TodosBloc todosBloc})
      : _todosBloc = todosBloc,
        super(TodosfilterLoading()) {
    on<UpdateTodos>(_onUpdateTodos);
    on<UpdateFilter>(_onUpdateFilter);
    _todosSubscription = todosBloc.stream.listen((state) {
      add(const UpdateFilter());
    });
  }

  void _onUpdateTodos(UpdateTodos event, Emitter<TodosfilterState> emit) {
    final state = _todosBloc.state;

    if (state is TodosLoaded) {
      todos = state.todos.where((todo) {
        switch (event.todosFilter) {
          case TodosFilter.all:
            return true;

          case TodosFilter.completed:
            return todo.isCompleted!;

          case TodosFilter.cancelled:
            return todo.isCancelled!;

          case TodosFilter.pending:
            return !(todo.isCancelled! || todo.isCompleted!);
        }
      }).toList();
    }
  }

  void _onUpdateFilter(UpdateFilter event, Emitter<TodosfilterState> emit) {
    if (state is TodosfilterLoading) {
      add(const UpdateTodos(todosFilter: TodosFilter.pending));
    }

    if (state is TodosfilterLoaded) {
      final state = this.state as TodosfilterLoaded;

      add(UpdateTodos(todosFilter: state.todosFilter));
    }
  }
}
