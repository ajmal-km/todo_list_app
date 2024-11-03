import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/model/todo_model.dart';

class HomeScreenState {
  String name;
  Box<TodoModel> todoBox;
  List<TodoModel> tasks;
  bool loading;
  HomeScreenState(
      {required this.tasks, required this.loading, required this.todoBox, required this.name});

  HomeScreenState copyWith({List<TodoModel>? tasklist, bool? isLoading, String? username}) =>
      HomeScreenState(
        todoBox: todoBox,
        name: username ?? this.name,
        tasks: tasklist ?? this.tasks,
        loading: isLoading ?? this.loading,
      );
}
