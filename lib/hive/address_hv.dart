import 'package:hive/hive.dart';
import 'package:user_list/hive/geo_hv.dart';

part 'address_hv.g.dart';

@HiveType(typeId: 1)
class AddressHv extends HiveObject {
  @HiveField(0)
  final String street;

  @HiveField(1)
  final String suite;

  @HiveField(2)
  final String city;

  @HiveField(3)
  final GeoHv geo;

  AddressHv({
    required this.street,
    required this.suite,
    required this.city,
    required this.geo,
  });
}
