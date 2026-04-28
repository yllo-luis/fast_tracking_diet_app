import 'dart:developer';

import 'package:fast_tracking_diet_app/data/datasource/local_datasource.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_kcal_routine_model.dart';

abstract class KcalRoutineRepositoryContract {
  Future<void> addKcalRoutine({
    required LocalKcalRoutineModel localKcalRoutine,
  });
  Future<List<LocalKcalRoutineModel>> getKcalRoutinePerUserId({
    required int userId,
  });
  Future<void> updateKcalRoutine({
    required LocalKcalRoutineModel localKcalRoutine,
  });
  Future<void> removeKcalRoutine({required int kcalRoutineId});
}

class KcalRoutineRepository implements KcalRoutineRepositoryContract {
  final LocalDatasource localDatasource;

  KcalRoutineRepository({required this.localDatasource});

  @override
  Future<void> addKcalRoutine({
    required LocalKcalRoutineModel localKcalRoutine,
  }) async {
    try {
      await localDatasource.addKcalRoutine(localKcalRoutine: localKcalRoutine);
    } catch (error, stacktrace) {
      log(
        'Error while adding local kcal routine: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<LocalKcalRoutineModel>> getKcalRoutinePerUserId({
    required int userId,
  }) async {
    try {
      final result = await localDatasource.getKcalRoutinePerUserId(userId: userId,);
      return result?.map((e) => LocalKcalRoutineModel.fromMap(map: e)).toList() ?? List.empty();
    } catch (error, stacktrace) {
      log(
        'Error while getting local kcal routine: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> removeKcalRoutine({required int kcalRoutineId}) async {
    try {
      await localDatasource.removeKcalRoutine(kcalRoutineId: kcalRoutineId);
    } catch (error, stacktrace) {
      log(
        'Error while removing local kcal routine: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> updateKcalRoutine({
    required LocalKcalRoutineModel localKcalRoutine,
  }) async {
    try {
      await localDatasource.updateKcalRoutine(localKcalRoutine: localKcalRoutine);
    } catch (error, stacktrace) {
      log(
        'Error while updating local kcal routine: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }
}
