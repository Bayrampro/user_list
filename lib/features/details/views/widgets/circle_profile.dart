import 'package:flutter/material.dart';

class CircleProfile extends StatelessWidget {
  final String firstName;
  final String lastName;

  const CircleProfile({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/avatar.avif'),
                ),
                const SizedBox(height: 12.0),
                Text(
                  firstName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  lastName,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 22),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
