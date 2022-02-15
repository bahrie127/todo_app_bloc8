import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc8/model/todosfilter_model.dart';
import 'package:todo_app_bloc8/pages/add_todo_page.dart';
import 'package:todo_app_bloc8/theme.dart';
import 'package:todo_app_bloc8/pages/widgets/todo_cards.dart';
import 'package:todo_app_bloc8/todosfilterbloc/todosfilter_bloc.dart';

import '../todosbloc/todos_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TODO BLoC'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTodoPage()),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
          bottom: TabBar(
            onTap: (tabIndex) {
              switch (tabIndex) {
                case 0:
                  BlocProvider.of<TodosfilterBloc>(context).add(
                    const UpdateTodos(todosFilter: TodosFilter.pending),
                  );
                  break;
                case 1:
                  BlocProvider.of<TodosfilterBloc>(context).add(
                    const UpdateTodos(todosFilter: TodosFilter.completed),
                  );
                  break;
              }
            },
            tabs: const [
              Tab(
                icon: Icon(Icons.pending),
              ),
              Tab(
                icon: Icon(Icons.add_task),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          _todos('Pending ToDos:'),
          _todos('Completed ToDos:'),
        ]),
      ),
    );
  }

  BlocConsumer<TodosfilterBloc, TodosfilterState> _todos(String title) {
    return BlocConsumer<TodosfilterBloc, TodosfilterState>(
      listener: (context, state) {
        if (state is TodosfilterLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  'There are ${state.filteredTodos.length} task in ${state.todosFilter.toString().split('.').last}')));
        }
      },
      builder: (context, state) {
        if (state is TodosfilterLoading) {
          return const CircularProgressIndicator();
        } else if (state is TodosfilterLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: primary,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.filteredTodos.length,
                    itemBuilder: (context, index) {
                      return (todoCard(context, state.filteredTodos[index]));
                    })
              ],
            ),
          );
        } else {
          return const Text('Error');
        }
      },
    );
  }
}
