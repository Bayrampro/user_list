import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/features/home/bloc/user_list_bloc.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UserListBloc>().add(LoadUserListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          BlocBuilder<UserListBloc, UserListState>(
            builder: (context, state) {
              if (state is UserListLoaded) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final users = state.userList;
                      users.sort((a, b) => a.name.compareTo(b.name));
                      return UserCard(
                        firstName: users[index].name,
                        lastName: users[index].username,
                        id: users[index].id,
                      );
                    },
                    childCount: state.userList.length,
                  ),
                );
              } else {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return const ShimmerUserCard();
                  },
                  childCount: 9,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
