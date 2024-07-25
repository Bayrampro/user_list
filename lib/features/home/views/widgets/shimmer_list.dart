import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserCard extends StatelessWidget {
  const ShimmerUserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[350]!, // более мягкий серый цвет
      highlightColor: Colors.grey[200]!, // еще более мягкий серый цвет
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
