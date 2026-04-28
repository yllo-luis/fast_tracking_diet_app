import 'package:fast_tracking_diet_app/data/repository/kcal_routine_repository.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_kcal_routine_model.dart';

class GetKcalRoutinePerUserIdUseCase {
  final KcalRoutineRepositoryContract _repository;

  GetKcalRoutinePerUserIdUseCase(this._repository);

  Future<List<LocalKcalRoutineModel>> call({required int userId}) {
    return _repository.getKcalRoutinePerUserId(userId: userId);
  }
}