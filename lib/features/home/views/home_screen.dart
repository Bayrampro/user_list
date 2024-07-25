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
                      final user = state.userList.data[index];
                      return UserCard(
                        firstName: user.firstName,
                        lastName: user.lastName,
                        imgUrl: user.imgUrl,
                        id: user.id,
                      );
                    },
                    childCount: state.userList.data.length,
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
