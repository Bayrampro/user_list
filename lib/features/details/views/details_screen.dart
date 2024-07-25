import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/features/details/bloc/details_bloc.dart';

import '../details.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    context.read<DetailsBloc>().add(LoadDetailsEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoaded) {
            final user = state.user.data;
            return CustomScrollView(
              slivers: [
                DetailsAppBar(
                  imgUrl: user.imgUrl,
                ),
                CircleProfile(
                  firstName: user.firstName,
                  lastName: user.lastName,
                  email: user.email,
                  imgUrl: user.imgUrl,
                ),
              ],
            );
          } else {
            return const CustomScrollView(
              slivers: [
                ShimmerCircleProfile(),
              ],
            );
          }
        },
      ),
    );
  }
}
