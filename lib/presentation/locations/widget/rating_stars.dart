import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          rating,
          (_) => Icon(Icons.star_rounded, color: Colors.yellow),
        ),
        ...List.generate(
          5 - rating,
          (_) => Icon(Icons.star_rounded, color: Colors.grey),
        ),
      ],
    );
  }
}
