import 'package:flutter/material.dart';
import 'package:urban_explorer/presentation/locations/favorites/screen/favorites_screen.dart';
import 'package:urban_explorer/presentation/locations/location_list/screen/location_list_screen.dart';
import 'package:urban_explorer/presentation/profile/profile_screen.dart';
import 'package:urban_explorer/presentation/style/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _availableScreens = [
    LocationListScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _availableScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        onTap: (index) => setState(() => _selectedIndex = index),
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.secondary,
      ),
    );
  }
}
