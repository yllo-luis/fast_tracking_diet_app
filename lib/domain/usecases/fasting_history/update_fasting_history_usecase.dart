import 'package:fast_tracking_diet_app/data/repository/fasting_repository.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_fasting_model.dart';

class UpdateFastingHistoryUseCase {
  final FastingRepositoryContract _repository;

  UpdateFastingHistoryUseCase(this._repository);

  Future<void> call({
    required int fastingId,
    required LocalFastingModel localFastingModel,
  }) {
    return _repository.updateFastingHistory(
      fastingId: fastingId,
      localFastingModel: localFastingModel,
    );
  }
}