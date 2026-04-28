import 'package:fast_tracking_diet_app/app/services/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/app/services/notification/notification_service.dart';
import 'package:fast_tracking_diet_app/app/services/shared_preferences/shared_preferences_service.dart';
import 'package:fast_tracking_diet_app/presentation/modules/splash/controller/splash_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/splash/view/background_permission_denied_view.dart';
import 'package:fast_tracking_diet_app/presentation/modules/splash/view/splash_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {
    i.add<SplashController>(
      () => SplashController(
        firebaseAuthService: Modular.get<FirebaseAuthService>(),
        notificationService: Modular.get<NotificationService>(),
        sharedPreferencesService: Modular.get<SharedPreferencesService>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => SplashView());
    r.child(
      '/background_permission_denied_view',
      child: (context) => BackgroundPermissionDeniedView(),
    );
  }
}
