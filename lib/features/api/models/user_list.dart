import 'package:json_annotation/json_annotation.dart';

import 'models.dart';
part 'user_list.g.dart';

@JsonSerializable()
class UserList {
  final List<User> data;

  UserList({
    required this.data,
  });

  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);
  Map<String, dynamic> toJson() => _$UserListToJson(this);
}
