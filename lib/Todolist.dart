import 'package:flutter/material.dart';

import 'package:project_test/Widgets/list_todo.dart';
import 'package:project_test/Models/Todo.dart';
import 'package:project_test/Widgets/newtodo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() {
    return _TodoListState();
  }
}

final todoListes = [
  Todo(
      Title: 'houssaine',
      amount: 45,
      dateCreated: DateTime.now(),
      myLeisure: leisure.food),
  Todo(
      Title: 'hassen',
      amount: 78,
      dateCreated: DateTime.now(),
      myLeisure: leisure.games),
  Todo(
      Title: 'jad',
      amount: 45,
      dateCreated: DateTime.now(),
      myLeisure: leisure.travel),
  Todo(
      Title: 'daly',
      amount: 45,
      dateCreated: DateTime.now(),
      myLeisure: leisure.sleep),
];

class _TodoListState extends State<TodoList> {
  void deleteTodoList(Todo todo) {
    final index = todoListes.indexOf(todo);
    setState(() {
      todoListes.remove(todo);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                todoListes.insert(index, todo);
              });
            })));
  }

  void _addTodo() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return newTodo(addTodoList: addTodoList);
        });
  }

  void addTodoList(Todo newtodo) {
    setState(() {
      todoListes.add(newtodo);
    });
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 68, 16, 16),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: _addTodo, icon: const Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            const Text('list of todo'),
            Expanded(
              child: listTodo(
                todoListes: todoListes,
                deleteTodo: deleteTodoList,
              ),
            )
          ],
        ),
      ),
    );
  }
}
