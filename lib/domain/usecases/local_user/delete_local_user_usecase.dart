import 'package:fast_tracking_diet_app/data/repository/user_repository.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';

class DeleteLocalUserUseCase {
  final UserRepositoryContract _repository;

  DeleteLocalUserUseCase(this._repository);

  Future<void> call({required LocalUserModel localUser}) {
    return _repository.deleteLocalUser(localUser: localUser);
  }
}