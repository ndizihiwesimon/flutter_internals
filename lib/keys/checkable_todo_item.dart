import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/keys.dart';

class CheckableItem extends StatefulWidget {
  const CheckableItem({super.key, required this.text, required this.priority});
  final String text;
  final Priority priority;

  @override
  State<CheckableItem> createState() => _CheckableItemState();
}

class _CheckableItemState extends State<CheckableItem> {
  Widget getIcon(Priority priority) {
    if (priority == Priority.urgent) {
      return const Icon(Icons.notifications_active);
    } else if (priority == Priority.normal) {
      return const Icon(Icons.list);
    } else {
      return const Icon(Icons.event_repeat_sharp);
    }
  }

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              }),
          const SizedBox(width: 12),
          getIcon(widget.priority),
          const SizedBox(width: 12),
          Text(widget.text),
        ],
      ),
    );
  }
}
