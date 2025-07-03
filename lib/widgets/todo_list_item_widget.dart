import 'package:flutter/material.dart';
import 'package:todo_list_riverpod/models/todo_model.dart';

class TodoListItemWidget extends StatelessWidget {
  final TodoModel item;

  const TodoListItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: item.completed, onChanged: (value) {}),
      title: Text(item.description),
    );
  }
}
