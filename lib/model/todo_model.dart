import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  TodoModel({
    this.category,
    this.title,
    this.description,
    this.date,
    this.dueDate,
    this.colorIndex,
  });

  @HiveField(0)
  String? category;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? dueDate;
  @HiveField(5)
  int? colorIndex;
}
