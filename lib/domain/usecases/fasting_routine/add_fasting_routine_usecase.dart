import 'package:fast_tracking_diet_app/data/repository/fasting_routine_repository.dart';
import 'package:fast_tracking_diet_app/domain/entity/fasting_routine_model.dart';

class AddFastingRoutineUseCase {
  final FastingRoutineRepositoryContract _repository;

  AddFastingRoutineUseCase(this._repository);

  Future<void> call({required FastingRoutineModel fastingRoutineModel}) {
    return _repository.addFastingRoutine(
      fastingRoutineModel: fastingRoutineModel,
    );
  }
}