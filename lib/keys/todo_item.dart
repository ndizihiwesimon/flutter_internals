import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/keys.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.text, required this.priority});
  final String text;
  final Priority priority;

  Widget getIcon(Priority priority) {
    if (priority == Priority.urgent) {
      return const Icon(Icons.notifications_active);
    } else if (priority == Priority.normal) {
      return const Icon(Icons.list);
    } else {
      return const Icon(Icons.event_repeat_sharp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          getIcon(priority),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }
}
