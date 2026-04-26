import 'package:fast_tracking_diet_app/data/repository/fasting_repository.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_fasting_model.dart';

class GetFastingHistoryPerUserIdUseCase {
  final FastingRepositoryContract _repository;

  GetFastingHistoryPerUserIdUseCase(this._repository);

  Future<List<LocalFastingModel>?> call({required int userId}) {
    return _repository.getFastingHistoryPerUserId(userId: userId);
  }
}