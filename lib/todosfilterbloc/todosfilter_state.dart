part of 'todosfilter_bloc.dart';

abstract class TodosfilterState extends Equatable {
  const TodosfilterState();

  @override
  List<Object> get props => [];
}

class TodosfilterLoading extends TodosfilterState {}

class TodosfilterLoaded extends TodosfilterState {
  final List<Todo> filteredTodos;
  final TodosFilter todosFilter;

  const TodosfilterLoaded({
    required this.filteredTodos,
    this.todosFilter = TodosFilter.all,
  });

  @override
  List<Object> get props => [filteredTodos, todosFilter];
}
