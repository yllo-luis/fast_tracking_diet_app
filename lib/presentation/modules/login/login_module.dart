import 'package:fast_tracking_diet_app/app/services/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/data/datasource/local_datasource.dart';
import 'package:fast_tracking_diet_app/data/repository/user_repository.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/create_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/get_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/presentation/modules/login/controller/login_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/login/store/login_store.dart';
import 'package:fast_tracking_diet_app/presentation/modules/login/view/login_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'view/register_view.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.add(
        () => UserRepository(
        localDatasource: Modular.get<LocalDatasource>(),
      )
    );

    i.add(
      () => LoginController(
        firebaseAuthService: Modular.get<FirebaseAuthService>(),
        loginStore: LoginStore(),
        createLocalUserUseCase: CreateLocalUserUseCase(
          Modular.get<UserRepository>()
        ),
        getLocalUserUseCase: GetLocalUserUseCase(
            Modular.get<UserRepository>()
        ),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => LoginView());
    r.child('/register', child: (context) => RegisterView());
  }
}
