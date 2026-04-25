import 'package:fast_tracking_diet_app/app/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/presentation/modules/login/controller/login_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/login/store/login_store.dart';
import 'package:fast_tracking_diet_app/presentation/modules/login/view/login_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'view/register_view.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.add(
      () => LoginController(
        firebaseAuthService: Modular.get<FirebaseAuthService>(),
        loginStore: LoginStore(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => LoginView());
    r.child('/register', child: (context) => RegisterView());
  }
}
