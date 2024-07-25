import 'package:json_annotation/json_annotation.dart';

import 'models.dart';
part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
  final User data;

  UserDetails({
    required this.data,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
