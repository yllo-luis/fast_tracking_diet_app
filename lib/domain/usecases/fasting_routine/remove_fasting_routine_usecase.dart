import 'package:fast_tracking_diet_app/data/repository/fasting_routine_repository.dart';

class RemoveFastingRoutineUseCase {
  final FastingRoutineRepositoryContract _repository;

  RemoveFastingRoutineUseCase(this._repository);

  Future<void> call({required int fastingRoutineId}) {
    return _repository.removeFastingRoutine(
      fastingRoutineId: fastingRoutineId,
    );
  }
}