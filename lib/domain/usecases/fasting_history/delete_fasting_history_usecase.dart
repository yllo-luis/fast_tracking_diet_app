import 'package:fast_tracking_diet_app/data/repository/fasting_repository.dart';

class DeleteFastingHistoryUseCase {
  final FastingRepositoryContract _repository;

  DeleteFastingHistoryUseCase(this._repository);

  Future<void> call({required int fastingId}) {
    return _repository.deleteFastingHistory(
      fastingId: fastingId,
    );
  }
}