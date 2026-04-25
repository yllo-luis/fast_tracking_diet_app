import 'package:fast_tracking_diet_app/app/auth/firebase_auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  SplashController({required this.firebaseAuthService});

  final FirebaseAuthService firebaseAuthService;

  /// Checking if user is logged in. If [firebaseAuthService]
  /// returns false then the user is going to be redirected to the [LoginModule] part of the application.
  Future<void> checkIfUserIsLoggedIn() async {
    await Future.delayed(const Duration(seconds: 2));

    if (firebaseAuthService.currentUser == null) {
      Modular.to.pushReplacementNamed('/login');
    } else {
      Modular.to.pushReplacementNamed('/home');
    }
  }
}
