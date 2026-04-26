import 'package:fast_tracking_diet_app/data/repository/fasting_repository.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_fasting_model.dart';

class CreateFastingHistoryUseCase {
  final FastingRepositoryContract _repository;

  CreateFastingHistoryUseCase(this._repository);

  Future<void> call({
    required int userId,
    required LocalFastingModel localFastingModel,
  }) {
    return _repository.createFastingHistory(
      userId: userId,
      localFastingModel: localFastingModel,
    );
  }
}