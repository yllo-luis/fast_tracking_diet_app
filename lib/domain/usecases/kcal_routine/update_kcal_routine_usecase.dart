import 'package:fast_tracking_diet_app/data/repository/kcal_routine_repository.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_kcal_routine_model.dart';

class UpdateKcalRoutineUseCase {
  final KcalRoutineRepositoryContract _repository;

  UpdateKcalRoutineUseCase(this._repository);

  Future<void> call({required LocalKcalRoutineModel localKcalRoutine}) {
    return _repository.updateKcalRoutine(localKcalRoutine: localKcalRoutine);
  }
}