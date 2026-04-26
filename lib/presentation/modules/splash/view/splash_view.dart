import 'package:fast_tracking_diet_app/presentation/modules/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final controller = Modular.get<SplashController>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

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
