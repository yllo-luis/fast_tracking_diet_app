import 'package:fast_tracking_diet_app/data/repository/user_repository.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';

class CreateLocalUserUseCase {
  final UserRepositoryContract _repository;

  CreateLocalUserUseCase(this._repository);

  Future<void> call({required LocalUserModel localUser}) {
    return _repository.createLocalUser(localUser: localUser);
  }
}