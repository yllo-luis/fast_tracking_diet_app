import 'package:fast_tracking_diet_app/domain/entity/fasting_routine_model.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_fasting_model.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class HomeStore {
  final ValueNotifier<int> currentPage = ValueNotifier(0);

  final ValueNotifier<List<FastingRoutineModel>> availableFastingModels =
      ValueNotifier(List.empty());
  final ValueNotifier<List<LocalFastingModel>> fastingHistory = ValueNotifier(
    List.empty(),
  );
  final ValueNotifier<LocalUserModel?> currentUser = ValueNotifier(null);

  StreamDuration? currentFastingTime = StreamDuration(
    config: const StreamDurationConfig(
      countDownConfig: CountDownConfig(duration: Duration(seconds: 0)),
    ),
  );
  ValueNotifier<FastingRoutineModel?> currentFastingModel = ValueNotifier(null);
  final ValueNotifier<DateTime?> lastFast = ValueNotifier(null);

  final ValueNotifier<bool> isLoadingRoutines = ValueNotifier(false);
  final ValueNotifier<bool> isCreatingNewFast = ValueNotifier(false);

  bool isDoingFasting = false;
}
