import 'package:json_annotation/json_annotation.dart';
import 'package:user_list/features/api/models/address.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String email;
  final String name;
  final String username;
  final Address address;
  final String phone;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.address,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
