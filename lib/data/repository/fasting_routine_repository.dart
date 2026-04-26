import 'dart:developer';

import 'package:fast_tracking_diet_app/data/datasource/local_datasource.dart';
import 'package:fast_tracking_diet_app/domain/entity/fasting_routine_model.dart';

abstract class FastingRoutineRepositoryContract {
  Future<void> addFastingRoutine({
    required FastingRoutineModel fastingRoutineModel,
  });
  Future<void> removeFastingRoutine({required int fastingRoutineId});
  Future<List<FastingRoutineModel>?> getFastingRoutines();
}

class FastingRoutineRepository implements FastingRoutineRepositoryContract {
  final LocalDatasource localDatasource;

  FastingRoutineRepository({required this.localDatasource});

  @override
  Future<void> addFastingRoutine({
    required FastingRoutineModel fastingRoutineModel,
  }) async {
    try {
      await localDatasource.addFastingRoutine(
        fastingModel: fastingRoutineModel,
      );
    } catch (error, stacktrace) {
      log(
        'Error while adding local fasting routine: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> removeFastingRoutine({required int fastingRoutineId}) async {
    try {
      await localDatasource.removeFastingRoute(
        fastingRoutineId: fastingRoutineId,
      );
    } catch (error, stacktrace) {
      log(
        'Error while removing local fasting routine: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<FastingRoutineModel>?> getFastingRoutines() async {
    try {
      final result = await localDatasource.getFastingRoutines();
      return result?.map((e) => FastingRoutineModel.fromMap(e)).toList() ??
          List.empty();
    } catch (error, stacktrace) {
      log(
        'Error while retrieving local fasting routine: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }
}
