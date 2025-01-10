import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:user_list/hive/address_hv.dart';
import 'package:user_list/hive/geo_hv.dart';
import 'package:user_list/hive/user_hv.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserHvAdapter());
  Hive.registerAdapter(AddressHvAdapter());
  Hive.registerAdapter(GeoHvAdapter());
  runApp(const ProviderScope(child: UserListApp()));
}
