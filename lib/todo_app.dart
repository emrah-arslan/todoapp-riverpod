import 'package:flutter/material.dart';
import 'package:todo_list_riverpod/models/todo_model.dart';
import 'package:todo_list_riverpod/widgets/title_widget.dart';
import 'package:todo_list_riverpod/widgets/todo_list_item_widget.dart';
import 'package:todo_list_riverpod/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends StatelessWidget {
  TodoApp({super.key});

  final newTodoController = TextEditingController();

  final List<TodoModel> allTodos = [
    TodoModel(id: const Uuid().v4(), description: 'Spora Git'),
    TodoModel(id: const Uuid().v4(), description: 'Alışveriş Yap'),
    TodoModel(id: const Uuid().v4(), description: 'Ders Çalış'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          TitleWidget(),
          TextField(
            controller: newTodoController,
            decoration: const InputDecoration(
              labelText: 'Bugün Neler Yapacaksın?',
            ),
            onSubmitted: (newTodo) {},
          ),
          const SizedBox(height: 20),
          const ToolbarWidget(),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
              key: ValueKey(allTodos[i].id),
              onDismissed: (_) {},
              child: TodoListItemWidget(item: allTodos[i]),
            ),
        ],
      ),
    );
  }
}
