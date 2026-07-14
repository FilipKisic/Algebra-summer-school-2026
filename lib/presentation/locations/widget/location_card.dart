import 'package:flutter/material.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/presentation/style/colors.dart';

class LocationCard extends StatelessWidget {
  final Location location;

  const LocationCard({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.maxFinite,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.network(location.imageUrl, width: 130, height: 110, fit: .cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  location.title,
                  style: TextStyle(fontSize: 20, fontWeight: .bold, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  location.address,
                  style: TextStyle(fontSize: 14, fontWeight: .bold, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${location.lat}, ${location.lng}',
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                Row(
                  children: [
                    ...List.generate(
                      location.rating,
                      (_) => Icon(Icons.star_rounded, color: Colors.yellow),
                    ),
                    ...List.generate(
                      5 - location.rating,
                      (_) => Icon(Icons.star_rounded, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.favorite_rounded, color: Colors.white),
        ],
      ),
    );
  }
}
