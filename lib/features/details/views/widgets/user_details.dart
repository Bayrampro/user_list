import 'package:flutter/material.dart';
import 'package:user_list/features/api/models/user.dart';

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text('${user.address.street}, ${user.address.city}'),
          Text('Suite: ${user.address.suite}'),
          const SizedBox(height: 16),
          Text(
            'Phone',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(user.phone),
        ],
      ),
    );
  }
}
