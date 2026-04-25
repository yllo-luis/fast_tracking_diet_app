import 'package:fast_tracking_diet_app/app/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/presentation/modules/splash/controller/splash_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/splash/view/splash_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {
    i.add<SplashController>(
      () => SplashController(
        firebaseAuthService: Modular.get<FirebaseAuthService>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => SplashView());
  }
}
