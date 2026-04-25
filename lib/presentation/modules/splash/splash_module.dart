import 'package:fast_tracking_diet_app/presentation/modules/splash/view/splash_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => SplashView());
  }
}
