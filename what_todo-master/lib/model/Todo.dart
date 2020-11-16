import 'package:json_annotation/json_annotation.dart';
part 'Todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey(nullable: true)
  final String id;
  @JsonKey(nullable: true)
  String title;
  @JsonKey(nullable: true)
  bool isDone;
  @JsonKey(nullable: true)
  final String createdTime;
  @JsonKey(nullable: true)
  String descraption;
  final String ownerId;
  Todo({this.id, this.title, this.isDone, this.createdTime, this.descraption,this.ownerId});

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'taskId': taskId,
  //     'title': title,
  //     'isDone': isDone,
  //   };
  // }
  factory Todo.fromJson(json) => _$TodoFromJson(json);
  toJson() => _$TodoToJson(this);
}
