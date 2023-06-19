import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/checkable_todo_item.dart';
import 'package:flutter_internals/keys/todo_item.dart';

enum Priority { urgent, normal, low }

class Todo {
  const Todo(this.text, this.priority);
  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});
  @override
  State<Keys> createState() {
    return _KeysState();
  }
}

class _KeysState extends State<Keys> {
  var _order = 'asc';
  final _todo = [
    const Todo(
      'Learn Flutter',
      Priority.urgent,
    ),
    const Todo(
      'Practice Flutter',
      Priority.normal,
    ),
    const Todo(
      'Explore other courses',
      Priority.low,
    )
  ];
  List<Todo> get _orderedTodo {
    final sortedTodo = List.of(_todo);
    sortedTodo.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodo;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
                _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward),
            label: Text('Sort ${_order == 'asc' ? 'Ascending' : 'Descending'}'),
          ),
        ),
        Expanded(
            child: Column(
          children: [
            for (final todo in _orderedTodo)
              CheckableItem(
                key: ValueKey(todo.text),
                text: todo.text,
                priority: todo.priority,
              ),
          ],
        ))
      ],
    );
  }
}
