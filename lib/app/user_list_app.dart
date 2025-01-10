import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:user_list/consts/consts.dart';
import 'package:user_list/features/api/api.dart';
import 'package:user_list/features/details/bloc/details_bloc.dart';
import 'package:user_list/features/home/bloc/user_list_bloc.dart';
import 'package:user_list/providers/theme_provider.dart';
import 'package:user_list/router/router.dart';
import 'package:user_list/ui/ui.dart';

class UserListApp extends ConsumerStatefulWidget {
  const UserListApp({super.key});

  @override
  ConsumerState<UserListApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<UserListApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseUrl = Confidential.baseUrl.value;
    final isDarkMode = ref.watch(themeProvider);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => UserListClient(baseUrl: baseUrl, Dio()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserListBloc(userListClient: context.read<UserListClient>()),
          ),
          BlocProvider(
            create: (context) =>
                DetailsBloc(userListClient: context.read<UserListClient>()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: isDarkMode ? darkTheme : lightTheme,
        ),
      ),
    );
  }
}
