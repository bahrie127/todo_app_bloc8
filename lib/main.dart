import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc8/todosfilterbloc/todosfilter_bloc.dart';
import '../todosbloc/todos_bloc.dart';
import 'model/todo_model.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(
              LoadTodos(todos: todos),
            ),
        ),
        BlocProvider(
          create: (context) => TodosfilterBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo BLoC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xff000A1F),
          appBarTheme: const AppBarTheme(color: Color(0xff000A1F)),
        ),
        home: const HomePage(),
      ),
    );
  }
}
