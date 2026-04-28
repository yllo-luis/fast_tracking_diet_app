import 'package:fast_tracking_diet_app/domain/entity/fasting_routine_model.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_fasting_model.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../../domain/entity/local_kcal_routine_model.dart';

class HomeStore {
  final ValueNotifier<int> currentPage = ValueNotifier(0);

  final ValueNotifier<List<FastingRoutineModel>> availableFastingModels =
      ValueNotifier(List.empty());
  final ValueNotifier<List<LocalFastingModel>> fastingHistory = ValueNotifier(
    List.empty(),
  );
  final ValueNotifier<List<LocalKcalRoutineModel>> kCalHistory = ValueNotifier(List.empty());
  final ValueNotifier<LocalUserModel?> currentUser = ValueNotifier(null);

  StreamDuration? currentFastingTime = StreamDuration(
    config: const StreamDurationConfig(
      countDownConfig: CountDownConfig(duration: Duration(seconds: 0)),
    ),
  );
  ValueNotifier<FastingRoutineModel> currentFastingModel = ValueNotifier(
    FastingRoutineModel(
      fastingPeriod: Duration(hours: 8),
      fastingRestPeriod: Duration(hours: 8),
      isCustom: false,
    ),
  );
  final ValueNotifier<DateTime?> lastFast = ValueNotifier(null);

  final ValueNotifier<bool> isLoadingRoutines = ValueNotifier(false);
  final ValueNotifier<bool> isCreatingNewFast = ValueNotifier(false);
  final ValueNotifier<bool> isLoadingFastingHistory = ValueNotifier(false);
  final ValueNotifier<bool> isLoadingKcalHistory = ValueNotifier(false);

  final ValueNotifier<Duration> timeElapsedFasting = ValueNotifier(
    Duration(seconds: 0),
  );

  bool isDoingFasting = false;
}
