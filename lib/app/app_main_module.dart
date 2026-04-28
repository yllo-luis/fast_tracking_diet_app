import 'package:fast_tracking_diet_app/app/services/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/app/services/notification/notification_service.dart';
import 'package:fast_tracking_diet_app/data/datasource/http_datasource.dart';
import 'package:fast_tracking_diet_app/data/datasource/local_datasource.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/home_module.dart';
import 'package:fast_tracking_diet_app/presentation/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'services/shared_preferences/shared_preferences_service.dart';
import '../presentation/modules/login/login_module.dart';

class AppMainModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(() => HttpDatasource());
    i.addSingleton(() => LocalDatasource());
    i.addSingleton(() => SharedPreferencesService());
    i.addSingleton(() => FirebaseAuthService());
    i.addSingleton(() => NotificationService());
  }

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/login', module: LoginModule());
    r.module('/home', module: HomeModule());
  }
}
