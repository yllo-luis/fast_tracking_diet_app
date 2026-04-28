import 'dart:async';
import 'dart:developer';

import 'package:fast_tracking_diet_app/app/services/auth/firebase_auth_service.dart';
import 'package:fast_tracking_diet_app/app/services/notification/notification_service.dart';
import 'package:fast_tracking_diet_app/app/services/shared_preferences/shared_preferences_service.dart';
import 'package:fast_tracking_diet_app/domain/entity/fasting_routine_model.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_fasting_model.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_kcal_routine_model.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_history/create_fasting_history_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_history/get_fasting_history_per_user_id_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/add_fasting_routine_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/get_fasting_routines_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/fasting_routine/remove_fasting_routine_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/get_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/domain/usecases/local_user/update_local_user_usecase.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:share_plus/share_plus.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../../app/l10n/app_localizations.dart';
import '../../../../domain/entity/local_user_model.dart';
import '../../../../domain/usecases/kcal_routine/add_kcal_routine_usecase.dart';
import '../../../../domain/usecases/kcal_routine/get_kcal_routine_per_user_id_usecase.dart';

/// Controller responsible for managing the business logic of the Home screen.
///
/// It handles fasting operations (start, pause, cancel, finish), notification management,
/// data fetching for fasting routines, history, and kcal routines, and user profile updates.
class HomeController {
  /// The state store for the home module.
  final HomeStore homeStore;

  /// Usecase for creating fasting history entries.
  final CreateFastingHistoryUseCase createFastingHistoryUseCase;

  /// Usecase for updating local user information.
  final UpdateLocalUserUseCase updateLocalUserUseCase;

  /// Usecase for adding a new fasting routine.
  final AddFastingRoutineUseCase createFastingRoutineUseCase;

  /// Usecase for retrieving local user data.
  final GetLocalUserUseCase getLocalUserUseCase;

  /// Usecase for retrieving available fasting routines.
  final GetFastingRoutinesUseCase getFastingRoutinesUseCase;

  /// Usecase for retrieving fasting history for a specific user.
  final GetFastingHistoryPerUserIdUseCase getFastingHistoryPerUserIdUseCase;

  /// Usecase for removing a fasting routine.
  final RemoveFastingRoutineUseCase removeFastingRoutineUseCase;

  /// Usecase for adding a new kcal routine entry.
  final AddKcalRoutineUseCase addKcalRoutineUseCase;

  /// Usecase for retrieving kcal history for a specific user.
  final GetKcalRoutinePerUserIdUseCase getKcalRoutinePerUserId;

  /// Service for handling local notifications.
  final NotificationService notificationService;

  /// Service for Firebase authentication.
  final FirebaseAuthService firebaseAuthService;

  /// Service for local persistent storage.
  final SharedPreferencesService sharedPreferencesService;

  /// Initializes the [HomeController] with required usecases and services.
  HomeController({
    required this.homeStore,
    required this.createFastingHistoryUseCase,
    required this.updateLocalUserUseCase,
    required this.getLocalUserUseCase,
    required this.createFastingRoutineUseCase,
    required this.getFastingRoutinesUseCase,
    required this.getFastingHistoryPerUserIdUseCase,
    required this.removeFastingRoutineUseCase,
    required this.addKcalRoutineUseCase,
    required this.getKcalRoutinePerUserId,
    required this.notificationService,
    required this.firebaseAuthService,
    required this.sharedPreferencesService,
  });

  /// Returns a notifier for the current bottom navigation page index.
  ValueNotifier<int> get getCurrentPage => homeStore.currentPage;

  /// Sets the current page index in the store.
  set setCurrentPage(int page) => homeStore.currentPage.value = page;

  /// Returns the list of available fasting routines from the store
  List<FastingRoutineModel> get availableFastings =>
      homeStore.availableFastingModels.value;

  /// Returns the current fasting countdown duration stream.
  StreamDuration? get fastingStreamDuration => homeStore.currentFastingTime;

  /// Controller for managing page transitions in the home view.
  final PageController _pageController = PageController(initialPage: 0);

  /// Returns the [PageController] used by the home screen's PageView.
  PageController get pageController => _pageController;

  /// Starts a fasting session.
  ///
  /// Updates the [homeStore] state, initializes or updates the countdown timer,
  /// enables background execution if possible, and requests notification permissions.
  Future<void> startFasting() async {
    homeStore.isDoingFasting = true;

    if (homeStore.currentFastingTime != null) {
      homeStore.currentFastingTime!.add(
        homeStore.currentFastingModel.value.fastingPeriod,
      );
      homeStore.currentFastingTime!.play();
    } else {
      homeStore.currentFastingTime = StreamDuration(
        config: StreamDurationConfig(
          countDownConfig: CountDownConfig(
            duration: homeStore.currentFastingModel.value.fastingPeriod,
          ),
        ),
      );
    }

    bool backgroundExecutionEnabled =
        await FlutterBackground.enableBackgroundExecution();

    if (backgroundExecutionEnabled == false) {
      log('It seems we have a issue keeping the app in the background.');
    }

    await notificationService.requestPermissions();
  }

  /// Pauses the current fasting session timer.
  Future<void> pauseFasting() async {
    homeStore.currentFastingTime!.pause();
  }

  /// Resumes the current fasting session timer.
  Future<void> resumeFasting() async {
    homeStore.currentFastingTime!.resume();
  }

  /// Cancels the current fasting session.
  ///
  /// Resets the timer, disables background execution, and records the partial fasting history.
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

    await createFastingHistoryUseCase
        .call(
          userId: homeStore.currentUser.value?.id ?? 0,
          localFastingModel: LocalFastingModel(
            userId: homeStore.currentUser.value?.id ?? 0,
            fastingDateStart: DateTime.now().subtract(
              Duration(
                hours:
                    homeStore.currentFastingModel.value.fastingPeriod.inHours,
              ),
            ),
            fastingDateEnd: DateTime.now(),
            fastingElapsedTime: homeStore.timeElapsedFasting.value,
            fastingTotalTime: homeStore.currentFastingModel.value.fastingPeriod,
          ),
        )
        .whenComplete(
          () => homeStore.timeElapsedFasting.value = Duration(seconds: 0),
        );
  }

  /// Handles completion of a fasting session.
  ///
  /// Records the completed fasting event in history and resets the elapsed time.
  Future<void> onFinishedFasting() async {
    await createFastingHistoryUseCase
        .call(
          userId: homeStore.currentUser.value?.id ?? 0,
          localFastingModel: LocalFastingModel(
            userId: homeStore.currentUser.value?.id ?? 0,
            fastingDateStart: DateTime.now().subtract(
              Duration(hours: homeStore.timeElapsedFasting.value.inHours),
            ),
            fastingDateEnd: DateTime.now(),
            fastingTotalTime: homeStore.currentFastingModel.value.fastingPeriod,
            fastingElapsedTime: homeStore.timeElapsedFasting.value,
          ),
        )
        .whenComplete(
          () => homeStore.timeElapsedFasting.value = Duration(seconds: 0),
        );
  }

  /// Shows a notification indicating that fasting has started.
  Future<void> showStartNotification({required BuildContext context}) =>
      notificationService.showNotification(
        title: AppLocalizations.of(context)!.homeFastingNotificationStartTitle,
        body: AppLocalizations.of(context)!.homeFastingNotificationStartBody,
      );

  /// Shows a notification indicating that fasting has been paused.
  Future<void> showPausedNotification({required BuildContext context}) =>
      notificationService.showNotification(
        title: AppLocalizations.of(context)!.homeFastingNotificationPausedTitle,
        body: AppLocalizations.of(context)!.homeFastingNotificationPausedBody,
      );

  /// Shows a notification indicating that fasting has been cancelled.
  Future<void> showCancelledNotification({
    required BuildContext context,
  }) => notificationService.showNotification(
    title: AppLocalizations.of(context)!.homeFastingNotificationCancelledTitle,
    body: AppLocalizations.of(context)!.homeFastingNotificationCancelledBody,
  );

  /// Shows a notification indicating that fasting has been completed.
  Future<void> showDoneNotification({
    required BuildContext context,
  }) => notificationService.showNotification(
    title: AppLocalizations.of(context)!.homeFastingNotificationCompletedTitle,
    body: AppLocalizations.of(context)!.homeFastingNotificationCompletedBody,
  );

  /// Fetches available fasting routines and updates the store.
  ///
  /// [alterLoading] determines whether to show a loading state during the operation.
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

  /// Fetches fasting history for the currently logged-in user.
  Future<void> getFastingHistory() async {
    homeStore.isLoadingFastingHistory.value = true;

    if (firebaseAuthService.currentUser != null &&
        homeStore.currentUser.value != null) {
      final results = await getFastingHistoryPerUserIdUseCase.call(
        userId: homeStore.currentUser.value!.id ?? 0,
      );

      homeStore.fastingHistory.value = results ?? List.empty();
    }

    homeStore.isLoadingFastingHistory.value = false;
  }

  /// Fetches kcal routine history for the currently logged-in user.
  Future<void> getKcalHistory() async {
    homeStore.isLoadingKcalHistory.value = true;

    if (firebaseAuthService.currentUser != null &&
        homeStore.currentUser.value != null) {
      final results = await getKcalRoutinePerUserId.call(
        userId: homeStore.currentUser.value!.id ?? 0,
      );

      homeStore.kCalHistory.value = results;
    }

    homeStore.isLoadingKcalHistory.value = false;
  }

  /// Retrieves the currently logged-in user profile from local storage.
  Future<void> getLoggedUser() async {
    if (firebaseAuthService.currentUser?.email?.isNotEmpty == true) {
      final results = await getLocalUserUseCase.call(
        username: firebaseAuthService.currentUser!.email!,
      );

      if (results?.isNotEmpty == true) {
        homeStore.currentUser.value = results!.first;
      }
    }
  }

  /// Updates the user's daily kcal target.
  Future<void> updateKcalTarget(int newTarget) async {
    final user = homeStore.currentUser.value;
    if (user != null) {
      final updatedUser = LocalUserModel(
        id: user.id,
        userName: user.userName,
        kcalTarget: newTarget,
      );
      await updateLocalUserUseCase.call(localUser: updatedUser);
      // Update the store to reflect changes in the UI
      homeStore.currentUser.value = updatedUser;
    }
  }

  /// Adds a new fasting routine to the user's list.
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

  /// Adds a new kcal routine entry.
  Future<void> createKcalRoutine({
    required LocalKcalRoutineModel localKcalModel,
  }) async {
    await addKcalRoutineUseCase.call(localKcalRoutine: localKcalModel);
  }

  /// Removes a fasting routine by its ID.
  Future<void> removeFastingRoutine({
    required FastingRoutineModel fastingRoutine,
  }) async {
    await removeFastingRoutineUseCase
        .call(fastingRoutineId: fastingRoutine.id ?? 0)
        .whenComplete(() => getFastingRoutines(alterLoading: false));
  }

  /// Shares the current fasting progress using the system share sheet.
  Future<void> shareFasting({required BuildContext context}) async {
    SharePlus.instance.share(
      ShareParams(
        text: AppLocalizations.of(context)!.homeFastingShareButtonText(
          '${homeStore.currentFastingModel.value.fastingPeriod.inHours}h/${homeStore.currentFastingModel.value.fastingRestPeriod.inHours}',
        ),
      ),
    );
  }
}
