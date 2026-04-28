import 'package:fast_tracking_diet_app/app/services/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/app/services/shared_preferences/shared_preferences_service.dart';
import 'package:fast_tracking_diet_app/data/datasource/local_datasource.dart';
import 'package:fast_tracking_diet_app/data/repository/fasting_repository.dart';
import 'package:fast_tracking_diet_app/data/repository/fasting_routine_repository.dart';
import 'package:fast_tracking_diet_app/data/repository/kcal_routine_repository.dart';
import 'package:fast_tracking_diet_app/data/repository/user_repository.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_history/create_fasting_history_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_history/get_fasting_history_per_user_id_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/add_fasting_routine_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/get_fasting_routines_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/remove_fasting_routine_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/kcal_routine/add_kcal_routine_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/kcal_routine/get_kcal_routine_per_user_id_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/get_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/update_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/controller/home_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/store/home_store.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/view/fasting_setting_view.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/view/home_view.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/view/kcal_registry_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app/services/notification/notification_service.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    // Adding Repositories.
    i.add(
      () => FastingRepository(localDatasource: Modular.get<LocalDatasource>()),
    );
    i.add(
      () => UserRepository(localDatasource: Modular.get<LocalDatasource>()),
    );
    i.add(
      () => FastingRoutineRepository(
        localDatasource: Modular.get<LocalDatasource>(),
      ),
    );
    i.add(
      () => KcalRoutineRepository(
        localDatasource: Modular.get<LocalDatasource>(),
      ),
    );

    i.addSingleton(
      () => HomeController(
        homeStore: HomeStore(),
        createFastingHistoryUseCase: CreateFastingHistoryUseCase(
          Modular.get<FastingRepository>(),
        ),
        updateLocalUserUseCase: UpdateLocalUserUseCase(
          Modular.get<UserRepository>(),
        ),
        getLocalUserUseCase: GetLocalUserUseCase(Modular.get<UserRepository>()),
        createFastingRoutineUseCase: AddFastingRoutineUseCase(
          Modular.get<FastingRoutineRepository>(),
        ),
        getFastingRoutinesUseCase: GetFastingRoutinesUseCase(
          Modular.get<FastingRoutineRepository>(),
        ),
        getFastingHistoryPerUserIdUseCase: GetFastingHistoryPerUserIdUseCase(
          Modular.get<FastingRepository>(),
        ),
        removeFastingRoutineUseCase: RemoveFastingRoutineUseCase(
          Modular.get<FastingRoutineRepository>(),
        ),
        addKcalRoutineUseCase: AddKcalRoutineUseCase(
          Modular.get<KcalRoutineRepository>(),
        ),
        getKcalRoutinePerUserId: GetKcalRoutinePerUserIdUseCase(
          Modular.get<KcalRoutineRepository>(),
        ),
        notificationService: Modular.get<NotificationService>(),
        firebaseAuthService: Modular.get<FirebaseAuthService>(),
        sharedPreferencesService: Modular.get<SharedPreferencesService>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => HomeView());
    r.child('/fasting_setting', child: (context) => const FastingSetting());
    r.child('/kcal_registry_view', child: (context) => const KcalRegistryView());
  }
}
