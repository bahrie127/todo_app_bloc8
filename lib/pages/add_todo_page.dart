import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc8/model/todo_model.dart';
import 'package:todo_app_bloc8/pages/widgets/add_todo_inputs.dart';
import 'package:todo_app_bloc8/theme.dart';

import '../todosbloc/todos_bloc.dart';

class AddTodoPage extends StatelessWidget {
  TextEditingController controllerID = TextEditingController();
  TextEditingController controllerTask = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TodosBloc, TodosState>(
        listener: (context, state) {
          if (state is TodosLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('To Do Added!')),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text('Add a ToDo', style: primary),
                ],
              ),
              const SizedBox(height: 8.0),
              inputDataAdd('ID', controllerID),
              inputDataAdd('Task', controllerTask),
              inputDataAdd('Description', controllerDesc),
              ElevatedButton(
                onPressed: () {
                  var todo = Todo(
                    id: controllerID.value.text,
                    task: controllerTask.value.text,
                    desc: controllerDesc.value.text,
                  );
                  context.read<TodosBloc>().add(AddTodo(todo: todo));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text(
                  'Add',
                  style: primary.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
