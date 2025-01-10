import 'package:hive/hive.dart';

part 'geo_hv.g.dart';

@HiveType(typeId: 2)
class GeoHv extends HiveObject {
  @HiveField(0)
  final String lat;

  @HiveField(1)
  final String lng;

  GeoHv({
    required this.lat,
    required this.lng,
  });
}
