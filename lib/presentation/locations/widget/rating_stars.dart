import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final Color foregroundColor;
  final double size;

  const RatingStars({
    super.key,
    required this.rating,
    this.foregroundColor = Colors.yellow,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          rating,
          (_) => Icon(
            Icons.star_rounded,
            color: foregroundColor,
            size: size,
          ),
        ),
        ...List.generate(
          5 - rating,
          (_) => Icon(
            Icons.star_rounded,
            color: Colors.grey,
            size: size,
          ),
        ),
      ],
    );
  }
}
