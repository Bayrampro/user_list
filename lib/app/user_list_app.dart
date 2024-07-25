import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/consts/consts.dart';
import 'package:user_list/features/api/api.dart';
import 'package:user_list/features/details/bloc/details_bloc.dart';
import 'package:user_list/features/home/bloc/user_list_bloc.dart';
import 'package:user_list/router/router.dart';
import 'package:user_list/ui/ui.dart';

class UserListApp extends StatelessWidget {
  const UserListApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseUrl = Confidential.baseUrl.value;
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
          theme: theme,
        ),
      ),
    );
  }
}
