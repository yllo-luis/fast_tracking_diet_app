import 'dart:developer';

import 'package:fast_tracking_diet_app/data/datasource/local_datasource.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_fasting_model.dart';

abstract class FastingRepositoryContract {
  Future<void> createFastingHistory({
    required int userId,
    required LocalFastingModel localFastingModel,
  });
  Future<void> updateFastingHistory({
    required int fastingId,
    required LocalFastingModel localFastingModel,
  });
  Future<List<LocalFastingModel>?> getFastingHistoryPerUserId({
    required int userId,
  });
  Future<void> deleteFastingHistory({required int fastingId});
}

class FastingRepository implements FastingRepositoryContract {
  final LocalDatasource localDatasource;

  FastingRepository({required this.localDatasource});

  @override
  Future<void> createFastingHistory({
    required int userId,
    required LocalFastingModel localFastingModel,
  }) async {
    try {
      await localDatasource.createFasting(
        userId: userId,
        localFasting: localFastingModel,
      );
    } catch (error, stacktrace) {
      log(
        'Error while creating local fasting history: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> deleteFastingHistory({required int fastingId}) async {
    try {
      await localDatasource.deleteFasting(fastingId: fastingId);
    } catch (error, stacktrace) {
      log(
        'Error while deleting local fasting history: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> updateFastingHistory({
    required int fastingId,
    required LocalFastingModel localFastingModel,
  }) async {
    try {
      await localDatasource.updateFasting(
        fastingId: fastingId,
        localFasting: localFastingModel,
      );
    } catch (error, stacktrace) {
      log(
        'Error while updating local fasting history: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<LocalFastingModel>?> getFastingHistoryPerUserId({
    required int userId,
  }) async {
    try {
      final result = await localDatasource.getFasting(userId: userId);
      return result?.map((e) => LocalFastingModel.fromMap(e)).toList() ?? List.empty();
    } catch (error, stacktrace) {
      log(
        'Error while updating local fasting history: $error',
        stackTrace: stacktrace,
      );
      rethrow;
    }
  }
}
