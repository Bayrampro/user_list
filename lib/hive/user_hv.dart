import 'package:hive/hive.dart';
import 'package:user_list/hive/address_hv.dart';

part 'user_hv.g.dart';

@HiveType(typeId: 0)
class UserHv extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String username;

  @HiveField(4)
  final AddressHv address;

  @HiveField(5)
  final String phone;

  UserHv({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.address,
    required this.phone,
  });
}
