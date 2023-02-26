// To parse this JSON data, do
//
//     final userTodo = userTodoFromJson(jsonString);

import 'dart:convert';

List<UserTodo> userTodoFromJson(String str) =>
    List<UserTodo>.from(json.decode(str).map((x) => UserTodo.fromJson(x)));

String userTodoToJson(List<UserTodo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserTodo {
  UserTodo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory UserTodo.fromJson(Map<String, dynamic> json) => UserTodo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
