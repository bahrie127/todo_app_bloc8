part of 'todosfilter_bloc.dart';

abstract class TodosfilterEvent extends Equatable {
  const TodosfilterEvent();

  @override
  List<Object> get props => [];
}

class UpdateFilter extends TodosfilterEvent {}

class UpdateTodos extends TodosfilterEvent {
  final TodosFilter todosFilter;

  const UpdateTodos({this.todosFilter = TodosFilter.all});

  @override
  List<Object> get props => [todosFilter];
}
