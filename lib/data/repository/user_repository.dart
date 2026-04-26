import 'dart:developer';

import 'package:fast_tracking_diet_app/data/datasource/local_datasource.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';

abstract class UserRepositoryContract {
  Future<void> createLocalUser({required LocalUserModel localUser});
  Future<void> updateLocalUser({required LocalUserModel localUser});
  Future<void> deleteLocalUser({required LocalUserModel localUser});
  Future<List<LocalUserModel>?> getLocalUser({required String username});
}

class UserRepository implements UserRepositoryContract {
  final LocalDatasource localDatasource;

  UserRepository({required this.localDatasource});

  @override
  Future<void> createLocalUser({required LocalUserModel localUser}) async {
    try {
      await localDatasource.createUser(localUser: localUser);
    } catch (error, stacktrace) {
      log('Error while creating local user: $error', stackTrace: stacktrace);
      rethrow;
    }
  }

  @override
  Future<void> deleteLocalUser({required LocalUserModel localUser}) async {
    try {
      await localDatasource.deleteUser(userId: localUser.id ?? 0);
    } catch (error, stacktrace) {
      log('Error while deleting local user: $error', stackTrace: stacktrace);
      rethrow;
    }
  }

  @override
  Future<void> updateLocalUser({required LocalUserModel localUser}) async {
    try {
      await localDatasource.updateUser(
        userId: localUser.id ?? 0,
        localUser: localUser,
      );
    } catch (error, stacktrace) {
      log('Error while updating local user: $error', stackTrace: stacktrace);
      rethrow;
    }
  }

  @override
  Future<List<LocalUserModel>?> getLocalUser({required String username}) async {
    try {
      final result = await localDatasource.getUser(userName: username);
      return result?.map((e) => LocalUserModel.fromMap(e)).toList() ??
          List.empty();
    } catch (error, stacktrace) {
      log('Error while updating local user: $error', stackTrace: stacktrace);
      rethrow;
    }
  }
}
