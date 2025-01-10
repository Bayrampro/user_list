import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  const DetailTile({
    super.key,
    required this.leadingBg,
    required this.iconColor,
    required this.titleText,
    required this.icon,
  });

  final Color leadingBg;
  final Color iconColor;
  final IconData icon;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: leadingBg,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      title: Text(
        titleText,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
