import 'package:flutter/material.dart';
import 'package:project_test/Models/Todo.dart';
import 'package:intl/intl.dart';

class todoItem extends StatelessWidget {
  final format = DateFormat.yMd();
  todoItem({required this.todo, super.key});

  final Todo todo;

  @override
  Widget build(context) {
    return Card(
      child: Row(children: [
        Text(todo.Title.toString().toUpperCase()),
        const SizedBox(
          width: 12,
        ),
        Icon(leisureIcons[todo.myLeisure]),
        const Spacer(),
        Column(
          children: [
            Text(todo.amount.toString()),
            Text(format.format(todo.dateCreated!))
          ],
        )
      ]),
    );
  }
}
