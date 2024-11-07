import 'package:todo_list_app/model/todo_model.dart';

class HomeScreenState {
  String name;
  List<TodoModel> tasks;
  bool loading;
  HomeScreenState(
      {required this.tasks, required this.loading,required this.name});

  HomeScreenState copyWith({List<TodoModel>? tasklist, bool? isLoading, String? username}) =>
      HomeScreenState(
        name: username ?? this.name,
        tasks: tasklist ?? this.tasks,
        loading: isLoading ?? this.loading,
      );
}
