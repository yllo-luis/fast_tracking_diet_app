import 'package:fast_tracking_diet_app/data/datasource/local_datasource.dart';
import 'package:fast_tracking_diet_app/data/repository/fasting_repository.dart';
import 'package:fast_tracking_diet_app/data/repository/fasting_routine_repository.dart';
import 'package:fast_tracking_diet_app/data/repository/user_repository.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_history/create_fasting_history_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_history/get_fasting_history_per_user_id_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/add_fasting_routine_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/get_fasting_routines_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/create_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/controller/home_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/store/home_store.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/view/fasting_setting.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

    i.addSingleton(
      () => HomeController(
        homeStore: HomeStore(),
        createFastingHistoryUseCase: CreateFastingHistoryUseCase(
          Modular.get<FastingRepository>(),
        ),
        createLocalUserUseCase: CreateLocalUserUseCase(
          Modular.get<UserRepository>(),
        ),
        createFastingRoutineUseCase: AddFastingRoutineUseCase(
          Modular.get<FastingRoutineRepository>(),
        ),
        getFastingRoutinesUseCase: GetFastingRoutinesUseCase(
          Modular.get<FastingRoutineRepository>(),
        ),
        getFastingHistoryPerUserIdUseCase: GetFastingHistoryPerUserIdUseCase(
          Modular.get<FastingRepository>(),
        ),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => HomeView());
    r.child('/settings', child: (context) => const Placeholder());
    r.child('/fasting_setting', child: (context) => const FastingSetting());
  }
}
