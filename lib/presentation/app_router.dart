import 'package:flutter/material.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/presentation/auth/sign_in/screen/sign_in_screen.dart';
import 'package:urban_explorer/presentation/auth/sign_up/screen/sign_up_screen.dart';
import 'package:urban_explorer/presentation/locations/screen/home_screen.dart';
import 'package:urban_explorer/presentation/splash/screen/splash_screen.dart';

import 'locations/details/screen/location_details_screen.dart';


class AppRouter {
  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String locationDetails = '/details';

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case splash: return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signIn: return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUp: return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case home: return MaterialPageRoute(builder: (_) => const HomeScreen());
      case locationDetails: return MaterialPageRoute(builder: (_) {
        final location = settings.arguments as Location;
        return LocationDetailsScreen(location: location);
      });

      default: throw Exception('Route not found.');
    }
  }
}