import 'package:flutter/material.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/presentation/common/widget/custom_primary_button.dart';
import 'package:urban_explorer/presentation/locations/widget/rating_stars.dart';
import 'package:urban_explorer/presentation/style/colors.dart';
import 'package:maps_launcher/maps_launcher.dart';

class LocationDetailsScreen extends StatefulWidget {
  final Location location;

  const LocationDetailsScreen({super.key, required this.location});

  @override
  State<LocationDetailsScreen> createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen> with TickerProviderStateMixin {
  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeOut,
      ),
    );

    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);

    _slideController.forward().then((_) => _fadeController.forward());
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final location = widget.location;
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
            SlideTransition(
              position: _slideAnimation,
              child: Container(
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
                    const SizedBox(height: 20),
                    Text(
                      'Rating',
                      style: TextStyle(fontSize: 16, fontWeight: .w600),
                    ),
                    RatingStars(
                      rating: location.rating,
                      foregroundColor: AppColors.secondary,
                      size: 28,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      location.description,
                      style: TextStyle(fontSize: 15, fontWeight: .w500),
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
            ),
            Positioned(
              top: screenSize.height * 0.30,
              right: 40,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: IconButton.filled(
                  iconSize: 36,
                  onPressed: () {},
                  icon: Icon(Icons.favorite_rounded),
                  style: IconButton.styleFrom(backgroundColor: AppColors.secondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _openInMaps() => MapsLauncher.launchCoordinates(widget.location.lat, widget.location.lng, widget.location.title);
}
