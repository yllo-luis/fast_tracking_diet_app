import 'package:fast_tracking_diet_app/data/datasource/http_datasource.dart';
import 'package:fast_tracking_diet_app/data/datasource/local_datasource.dart';
import 'package:fast_tracking_diet_app/presentation/modules/splash/splash_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../data/datasource/sharedpreferences_datasource.dart';

class AppMainModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(() => HttpDatasource());
    i.addSingleton(() => LocalDatasource());
    i.addSingleton(() => SharedPreferencesDatasource());
  }

  @override
  void routes(RouteManager r) {
    r.module('/splash', module: SplashModule());
    r.child('/home', child: (context) => const Placeholder());
    r.child('/activity', child: (context) => const Placeholder());
    r.child('/fast_history', child: (context) => const Placeholder());
  }
}
