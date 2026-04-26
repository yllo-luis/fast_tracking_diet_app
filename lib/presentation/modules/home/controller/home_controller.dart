import 'package:fast_tracking_diet_app/domain/entity/fasting_routine_model.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_history/create_fasting_history_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_history/get_fasting_history_per_user_id_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/add_fasting_routine_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/get_fasting_routines_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/create_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';

class HomeController {
  final HomeStore homeStore;
  final CreateFastingHistoryUseCase createFastingHistoryUseCase;
  final CreateLocalUserUseCase createLocalUserUseCase;
  final AddFastingRoutineUseCase createFastingRoutineUseCase;
  final GetFastingRoutinesUseCase getFastingRoutinesUseCase;
  final GetFastingHistoryPerUserIdUseCase getFastingHistoryPerUserIdUseCase;

  HomeController({
    required this.homeStore,
    required this.createFastingHistoryUseCase,
    required this.createLocalUserUseCase,
    required this.createFastingRoutineUseCase,
    required this.getFastingRoutinesUseCase,
    required this.getFastingHistoryPerUserIdUseCase,
  });

  ValueNotifier<int> get getCurrentPage => homeStore.currentPage;
  set setCurrentPage(int page) => homeStore.currentPage.value = page;

  List<FastingRoutineModel> get availableFastings =>
      homeStore.availableFastingModels.value;

  Future<void> getFastingRoutines() async {
    homeStore.isLoadingRoutines.value = true;

    final result = await getFastingRoutinesUseCase.call();

    homeStore.availableFastingModels.value = result ?? List.empty();

    if (availableFastings.isNotEmpty) {
      homeStore.currentFastingModel = ValueNotifier(availableFastings.first);
    }

    homeStore.isLoadingRoutines.value = false;
  }

  Future<void> createFastingRoutines({
    required FastingRoutineModel fastingRoutine,
  }) async {
    await createFastingRoutineUseCase.call(fastingRoutineModel: fastingRoutine);
  }
}
