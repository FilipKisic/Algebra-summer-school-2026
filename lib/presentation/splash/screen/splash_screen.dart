import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/camping_image.png'),
              const SizedBox(height: 50),
              Lottie.asset('assets/animations/loading_dots.json', width: 100),
            ],
          ),
        ),
      ),
    );
  }
}
