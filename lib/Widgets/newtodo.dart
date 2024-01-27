import 'package:flutter/material.dart';
import 'package:project_test/Models/Todo.dart';
import 'package:intl/intl.dart';

final format = DateFormat.yMd();

class newTodo extends StatefulWidget {
  final void Function(Todo) addTodoList;
  const newTodo({required this.addTodoList, super.key});

  @override
  State<newTodo> createState() {
    return _newTodoState();
  }
}

class _newTodoState extends State<newTodo> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _dateTime;
  leisure leisureTaked = leisure.food;
  void _showCalenderSelector() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, now.month, now.day);
    final datechoosen =
        await showDatePicker(context: context, firstDate: first, lastDate: now);
    if (datechoosen == null) return;
    setState(() {
      _dateTime = datechoosen;
    });
  }

  void _submitTodo() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount < 0 || title.trim().isEmpty) {
      showAboutDialog(context: context, children: [
        const Text('try to fix amount or date or name plz'),
        const Icon(Icons.error),
      ]);
    } else {
      final newtodo = Todo(
          Title: title,
          amount: amount,
          dateCreated: _dateTime,
          myLeisure: leisureTaked);
      widget.addTodoList(newtodo);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(context) {
    print(leisure.values);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
              controller: _titleController,
              maxLength: 50,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(label: Text('Title'))),
          TextField(
            keyboardType: TextInputType.number,
            controller: _amountController,
            maxLength: 3,
            decoration: const InputDecoration(
                label: Text('Amount'), prefix: Text("\$")),
          ),
          Row(
            children: [
              Text(_dateTime == null
                  ? 'No Seleted Date'
                  : format.format(_dateTime!)),
              IconButton(
                  onPressed: () {
                    _showCalenderSelector();
                  },
                  icon: const Icon(Icons.calendar_month)),
              const Spacer(),
              DropdownButton(
                  value:leisureTaked,
                  items: leisure.values
                      .map((e) => DropdownMenuItem(
                          value: e, child: Text(e.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        leisureTaked = value;
                      });
                    }
                  })
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: _submitTodo, child: const Text('Submit')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'))
            ],
          )
        ],
      ),
    );
  }
}
