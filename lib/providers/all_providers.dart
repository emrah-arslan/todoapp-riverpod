import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_riverpod/models/todo_model.dart';
import 'package:todo_list_riverpod/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

final todoListProvider =
StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager([
    TodoModel(id: const Uuid().v4(), description: "Spora Git"),
    TodoModel(id: const Uuid().v4(), description: "Alıveriş Yap"),
    TodoModel(id: const Uuid().v4(), description: "Ders Çalış"),
  ]);
});