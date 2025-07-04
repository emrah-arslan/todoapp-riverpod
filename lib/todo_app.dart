import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/providers/all_providers.dart';
import 'package:todo_list_riverpod/widgets/title_widget.dart';
import 'package:todo_list_riverpod/widgets/todo_list_item_widget.dart';
import 'package:todo_list_riverpod/widgets/toolbar_widget.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({super.key});

  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(todoListProvider);
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
            onSubmitted: (newTodo) {
              ref.read(todoListProvider.notifier).addTodo(newTodo);
            },
          ),
          const SizedBox(height: 20),
          const ToolbarWidget(),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
              key: ValueKey(allTodos[i].id),
              onDismissed: (_) {
                ref.read(todoListProvider.notifier).remove(allTodos[i]);
              },
              child: TodoListItemWidget(item: allTodos[i]),
            ),
        ],
      ),
    );
  }
}
