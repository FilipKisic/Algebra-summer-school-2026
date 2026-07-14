import 'package:flutter/material.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/presentation/common/widget/custom_primary_button.dart';
import 'package:urban_explorer/presentation/locations/widget/rating_stars.dart';

class LocationDetailsScreen extends StatelessWidget {
  final Location location;

  const LocationDetailsScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Hero(
              tag: location.id,
              child: Image.network(location.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 350),
                  Text(location.title),
                  Text(location.address),
                  Text('Rating'),
                  RatingStars(rating: location.rating),
                  Text(location.description),
                  Spacer(),
                  CustomPrimaryButton(
                    label: 'Show on maps',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
