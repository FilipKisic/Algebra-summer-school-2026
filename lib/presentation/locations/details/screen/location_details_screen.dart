import 'package:flutter/material.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/presentation/common/widget/custom_primary_button.dart';
import 'package:urban_explorer/presentation/locations/widget/rating_stars.dart';
import 'package:urban_explorer/presentation/style/colors.dart';

class LocationDetailsScreen extends StatelessWidget {
  final Location location;

  const LocationDetailsScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Hero(
              tag: location.id,
              child: Image.network(
                location.imageUrl,
                height: screenSize.height * 0.35,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 60,
              left: 20,
              child: IconButton.filled(
                onPressed: () => Navigator.of(context).pop(),
                iconSize: 36,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: AppColors.primary,
                ),
                style: IconButton.styleFrom(backgroundColor: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.33),
              padding: EdgeInsets.all(20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
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
            Positioned(
              top: screenSize.height * 0.30,
              right: 40,
              child: IconButton.filled(
                iconSize: 36,
                onPressed: () {},
                icon: Icon(Icons.favorite_rounded),
                style: IconButton.styleFrom(backgroundColor: AppColors.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
