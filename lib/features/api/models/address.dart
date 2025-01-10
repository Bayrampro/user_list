import 'package:json_annotation/json_annotation.dart';
import 'package:user_list/features/api/models/geo.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.geo,
  });
  final String street;
  final String suite;
  final String city;
  final Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
