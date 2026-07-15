import 'package:flutter/material.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/presentation/common/widget/custom_primary_button.dart';
import 'package:urban_explorer/presentation/locations/widget/rating_stars.dart';
import 'package:urban_explorer/presentation/style/colors.dart';
import 'package:maps_launcher/maps_launcher.dart';

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
                crossAxisAlignment: .start,
                children: [
                  Text(
                    location.title,
                    style: TextStyle(fontSize: 32, fontWeight: .bold),
                  ),
                  Text(
                    location.address,
                    style: TextStyle(fontSize: 18, fontWeight: .w600),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Rating',
                    style: TextStyle(fontSize: 16, fontWeight: .w600),
                  ),
                  RatingStars(
                    rating: location.rating,
                    foregroundColor: AppColors.secondary,
                    size: 28,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    location.description,
                    textAlign: .justify,
                  ),
                  Spacer(),
                  CustomPrimaryButton(
                    label: 'Show on maps',
                    onPressed: _openInMaps,
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

  void _openInMaps() => MapsLauncher.launchCoordinates(location.lat, location.lng, location.title);
}
