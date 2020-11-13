// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    id: json['id'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    todoList: (json['todoList'] as List)
        ?.map((e) => e == null ? null : Todo.fromJson(e))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'todoList': instance.todoList,
    };
