import 'package:fast_tracking_diet_app/data/repository/fasting_routine_repository.dart';
import 'package:fast_tracking_diet_app/domain/entity/fasting_routine_model.dart';

class GetFastingRoutinesUseCase {
  final FastingRoutineRepositoryContract _repository;

  GetFastingRoutinesUseCase(this._repository);

  Future<List<FastingRoutineModel>?> call() {
    return _repository.getFastingRoutines();
  }
}