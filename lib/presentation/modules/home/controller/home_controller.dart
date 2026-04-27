import 'dart:async';
import 'dart:developer';

import 'package:fast_tracking_diet_app/domain/entity/fasting_routine_model.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_history/create_fasting_history_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_history/get_fasting_history_per_user_id_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/add_fasting_routine_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/get_fasting_routines_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/remove_fasting_routine_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/create_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:share_plus/share_plus.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../../app/l10n/app_localizations.dart';

class HomeController {
  final HomeStore homeStore;
  final CreateFastingHistoryUseCase createFastingHistoryUseCase;
  final CreateLocalUserUseCase createLocalUserUseCase;
  final AddFastingRoutineUseCase createFastingRoutineUseCase;
  final GetFastingRoutinesUseCase getFastingRoutinesUseCase;
  final GetFastingHistoryPerUserIdUseCase getFastingHistoryPerUserIdUseCase;

  final RemoveFastingRoutineUseCase removeFastingRoutineUseCase;

  HomeController({
    required this.homeStore,
    required this.createFastingHistoryUseCase,
    required this.createLocalUserUseCase,
    required this.createFastingRoutineUseCase,
    required this.getFastingRoutinesUseCase,
    required this.getFastingHistoryPerUserIdUseCase,
    required this.removeFastingRoutineUseCase,
  });

  ValueNotifier<int> get getCurrentPage => homeStore.currentPage;
  set setCurrentPage(int page) => homeStore.currentPage.value = page;

  List<FastingRoutineModel> get availableFastings =>
      homeStore.availableFastingModels.value;

  StreamDuration? get fastingStreamDuration => homeStore.currentFastingTime;

  Future<void> startFasting() async {
    homeStore.isDoingFasting = true;

    if (homeStore.currentFastingTime != null) {
      homeStore.currentFastingTime!.add(
        homeStore.currentFastingModel.value!.fastingPeriod,
      );
      homeStore.currentFastingTime!.play();
    } else {
      homeStore.currentFastingTime = StreamDuration(
        config: StreamDurationConfig(
          countDownConfig: CountDownConfig(
            duration: homeStore.currentFastingModel.value!.fastingPeriod,
          ),
        ),
      );
    }

    bool success = await FlutterBackground.enableBackgroundExecution();

    if (success == false) {
      log('It seems we have a issue keeping the app in the background.');
    }
  }

  Future<void> pauseFasting() async {
    homeStore.currentFastingTime!.pause();
  }

  Future<void> resumeFasting() async {
    homeStore.currentFastingTime!.resume();
  }

  Future<void> cancelFasting() async {
    homeStore.isDoingFasting = false;

    homeStore.currentFastingTime!.pause();
    homeStore.currentFastingTime!.subtract(homeStore.currentFastingTime!.value);

    homeStore.currentFastingTime = null;

    bool isBackgroundRunningEnabled =
        FlutterBackground.isBackgroundExecutionEnabled;

    if (isBackgroundRunningEnabled) {
      await FlutterBackground.disableBackgroundExecution();
    }
  }

  Future<void> getFastingRoutines({bool alterLoading = true}) async {
    if (alterLoading) {
      homeStore.isLoadingRoutines.value = true;
    }

    final result = await getFastingRoutinesUseCase.call();

    homeStore.availableFastingModels.value = result ?? List.empty();

    if (availableFastings.isNotEmpty) {
      homeStore.currentFastingModel = ValueNotifier(availableFastings.first);
    }

    if (alterLoading) {
      homeStore.isLoadingRoutines.value = false;
    }
  }

  Future<void> createFastingRoutines({
    required FastingRoutineModel fastingRoutine,
  }) async {
    homeStore.isCreatingNewFast.value = true;

    await createFastingRoutineUseCase
        .call(fastingRoutineModel: fastingRoutine)
        .whenComplete(() {
          homeStore.isCreatingNewFast.value = false;
          getFastingRoutines();
        });
  }

  Future<void> removeFastingRoutine({
    required FastingRoutineModel fastingRoutine,
  }) async {
    await removeFastingRoutineUseCase
        .call(fastingRoutineId: fastingRoutine.id ?? 0)
        .whenComplete(() => getFastingRoutines(alterLoading: false));
  }

  Future<void> shareFasting({required BuildContext context}) async {
    SharePlus.instance.share(
      ShareParams(
        text: AppLocalizations.of(context)!.homeFastingShareButtonText(
          '${homeStore.currentFastingModel.value!.fastingPeriod.inHours}h/${homeStore.currentFastingModel.value!.fastingRestPeriod.inHours}',
        ),
      ),
    );
  }
}
