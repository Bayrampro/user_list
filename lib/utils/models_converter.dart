import 'package:user_list/features/api/models/address.dart';
import 'package:user_list/features/api/models/geo.dart';
import 'package:user_list/features/api/models/user.dart';
import 'package:user_list/hive/address_hv.dart';
import 'package:user_list/hive/geo_hv.dart';
import 'package:user_list/hive/user_hv.dart';

class ModelsConverter {
  UserHv convertApiUserToHiveUser(User apiUser) {
    return UserHv(
      id: apiUser.id,
      name: apiUser.name,
      username: apiUser.username,
      email: apiUser.email,
      address: AddressHv(
        street: apiUser.address.street,
        suite: apiUser.address.suite,
        city: apiUser.address.city,
        geo: GeoHv(
          lat: apiUser.address.geo.lat,
          lng: apiUser.address.geo.lng,
        ),
      ),
      phone: apiUser.phone,
    );
  }

  User convertHiveUserToApiUser(UserHv hiveUser) {
    return User(
      id: hiveUser.id,
      name: hiveUser.name,
      username: hiveUser.username,
      email: hiveUser.email,
      address: Address(
        street: hiveUser.address.street,
        suite: hiveUser.address.suite,
        city: hiveUser.address.city,
        geo: Geo(
          lat: hiveUser.address.geo.lat,
          lng: hiveUser.address.geo.lng,
        ),
      ),
      phone: hiveUser.phone,
    );
  }
}
