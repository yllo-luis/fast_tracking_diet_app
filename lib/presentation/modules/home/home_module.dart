import 'package:fast_tracking_diet_app/presentation/modules/home/controller/home_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/store/home_store.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add(() => HomeController(homeStore: HomeStore()));
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => HomeView());
    r.child('/settings', child: (context) => const Placeholder());
    r.child('/fasting_setting', child: (context) => const Placeholder());
  }
}
