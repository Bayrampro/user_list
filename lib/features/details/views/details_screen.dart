import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_list/features/details/bloc/details_bloc.dart';
import 'package:user_list/features/details/views/widgets/circle_profile.dart';
import 'package:user_list/features/details/views/widgets/detail_tile.dart';
import 'package:user_list/features/details/views/widgets/shimmer_circle_profile.dart';

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
            final user = state.user;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () => context.go('/'),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CircleProfile(
                    firstName: user.name,
                    lastName: user.username,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        DetailTile(
                          leadingBg: const Color.fromARGB(255, 177, 27, 16),
                          icon: Icons.location_on,
                          iconColor: const Color.fromARGB(255, 214, 153, 149),
                          titleText:
                              '${user.address.street}, ${user.address.suite}, ${user.address.city}',
                        ),
                        DetailTile(
                          leadingBg: const Color.fromARGB(255, 245, 216, 0),
                          icon: Icons.phone,
                          iconColor: const Color.fromARGB(255, 255, 255, 255),
                          titleText: user.phone,
                        ),
                        DetailTile(
                          leadingBg: const Color.fromARGB(255, 0, 255, 242),
                          icon: Icons.email,
                          iconColor: const Color.fromARGB(255, 255, 255, 255),
                          titleText: user.email,
                        ),
                        const Accordion()
                      ],
                    ),
                  ),
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

class Accordion extends StatelessWidget {
  const Accordion({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(
          'Геолокация',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://maps.geoapify.com/v1/staticmap?style=osm-bright&width=600&height=400&center=lonlat:-122.304378,47.526022&zoom=14&apiKey=4e1b45f7999c441c953dbbb257666ab9',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
