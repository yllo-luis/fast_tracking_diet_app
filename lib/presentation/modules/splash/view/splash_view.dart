import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        spacing: 24,
        children: [
          Lottie.asset('assets/fasting_splash_animation_asset.json'),
          const CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
