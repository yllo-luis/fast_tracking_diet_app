import 'package:fast_tracking_diet_app/data/repository/user_repository.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';

class GetLocalUserUseCase {
  final UserRepositoryContract _repository;

  GetLocalUserUseCase(this._repository);

  Future<List<LocalUserModel>?> call({required String username}) {
    return _repository.getLocalUser(username: username);
  }
}