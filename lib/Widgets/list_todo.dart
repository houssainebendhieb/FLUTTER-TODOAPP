import 'package:flutter/material.dart';
import 'package:project_test/Models/Todo.dart';
import 'package:project_test/Widgets/todo_item.dart';

class listTodo extends StatelessWidget {
  final void Function(Todo) deleteTodo;
  const listTodo(
      {required this.todoListes, required this.deleteTodo, super.key});
  final List<Todo> todoListes;

  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: todoListes.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(todoListes[index]),
              background: Container(
                color: Colors.green,
              ),
              child: todoItem(todo: todoListes[index]),
              onDismissed: (direction) {
                deleteTodo(todoListes[index]);
              },
            ));
  }
}
