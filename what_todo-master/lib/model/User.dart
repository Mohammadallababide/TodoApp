import 'package:json_annotation/json_annotation.dart';
import 'package:what_todo/model/Todo.dart';
part 'User.g.dart';

@JsonSerializable()
class User {
  @JsonKey(nullable: true)
  String name;
  @JsonKey(nullable: true)
  String id;
  final String token;
  @JsonKey(nullable: true)
  String email;
  @JsonKey(nullable: true)
  String password;
  @JsonKey(nullable: true)
  List<Todo> todoList;
  User({this.name, this.id, this.email, this.password, this.todoList,this.token});
  factory User.fromJson(json) => _$UserFromJson(json);
  toJson() => _$UserToJson(this);
}
