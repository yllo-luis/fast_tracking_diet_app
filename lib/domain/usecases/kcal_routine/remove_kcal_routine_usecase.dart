import 'package:fast_tracking_diet_app/data/repository/kcal_routine_repository.dart';

class RemoveKcalRoutineUseCase {
  final KcalRoutineRepositoryContract _repository;

  RemoveKcalRoutineUseCase(this._repository);

  Future<void> call({required int kcalRoutineId}) {
    return _repository.removeKcalRoutine(kcalRoutineId: kcalRoutineId);
  }
}
