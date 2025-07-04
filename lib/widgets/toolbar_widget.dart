import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/providers/all_providers.dart';

class ToolbarWidget extends ConsumerWidget {
  const ToolbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int onCompletedTodoCount = ref
        .watch(todoListProvider)
        .where((element) => !element.completed)
        .length;
    return Row(
      children: [
        Expanded(
          child: Text(
            onCompletedTodoCount == 0
                ? 'Tüm görevler OK'
                : onCompletedTodoCount.toString() + " görev tamamlanmadı",
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Tooltip(
          message: 'All Todos',
          child: TextButton(onPressed: () {}, child: const Text('All')),
        ),
        Tooltip(
          message: 'Only Uncompleted Todos',
          child: TextButton(onPressed: () {}, child: const Text('Active')),
        ),
        Tooltip(
          message: 'Only Completed Todos',
          child: TextButton(onPressed: () {}, child: const Text('Completed')),
        ),
      ],
    );
  }
}
