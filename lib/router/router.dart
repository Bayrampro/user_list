import 'package:go_router/go_router.dart';
import 'package:user_list/features/details/details.dart';
import 'package:user_list/features/home/home.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return DetailsScreen(
          id: id,
        );
      },
    ),
  ],
);
