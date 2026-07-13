import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:urban_explorer/presentation/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectToNextScreen(context);
  }

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

  void redirectToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    FirebaseAuth.instance.currentUser == null
        ? Navigator.of(context).pushReplacementNamed(AppRouter.signIn)
        : Navigator.of(context).pushReplacementNamed(AppRouter.home);
  }
}
