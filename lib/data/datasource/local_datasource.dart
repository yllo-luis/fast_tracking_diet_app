import 'package:fast_tracking_diet_app/domain/entity/local_fasting_model.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDatasourceContract {
  Future<void> onInitLocalDatasource();
  Future<void> createUser({required LocalUserModel localUser});
  Future<void> createFasting({
    required int userId,
    required LocalFastingModel localFasting,
  });
  Future<void> updateUser({
    required int userId,
    required LocalUserModel localUser,
  });
  Future<void> updateFasting({
    required int fastingId,
    required LocalFastingModel localFasting,
  });
  Future<void> deleteUser({required int userId});
  Future<void> deleteFasting({required int fastingId});
}

class LocalDatasource implements LocalDatasourceContract {
  LocalDatasource() {
    onInitLocalDatasource();
  }

  Database? database;

  @override
  Future<void> onInitLocalDatasource() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'fasting_database.db');

    // open the database
    database = await openDatabase(
      path,
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS "users" (
            "user_id" INTEGER PRIMARY KEY AUTOINCREMENT,
            "username" TEXT,
            "birthdate" TEXT
          );
        ''');

        // Create child table with foreign key
        await db.execute('''
          CREATE TABLE IF NOT EXISTS "fast_history" (
            "id" INTEGER PRIMARY KEY AUTOINCREMENT,
            "user_id" INTEGER NOT NULL,
            "date_start" TEXT NOT NULL,
            "date_end" TEXT,
            "is_current" INTEGER NOT NULL DEFAULT 0,
            FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON UPDATE NO ACTION ON DELETE CASCADE
          );
        ''');
      },
    );
  }

  @override
  Future<void> createUser({required LocalUserModel localUser}) async {
    if (database == null) {
      throw Exception(
        'The database is not initialized check the instance on the dependency injection',
      );
    }

    await database?.insert('users', {
      'username': localUser.userName,
      'birthdate': localUser.birthdate.toIso8601String(),
    });
  }

  @override
  Future<void> createFasting({
    required int userId,
    required LocalFastingModel localFasting,
  }) async {
    if (database == null) {
      throw Exception(
        'The database is not initialized check the instance on the dependency injection',
      );
    }

    await database?.insert('fast_history', {
      'user_id': localFasting.userId, // Must correspond to an existing user_id
      'date_start': localFasting.fastingDateStart.toIso8601String(),
      'date_end': localFasting.fastingDateEnd?.toIso8601String(),
      'is_current': localFasting.isCurrent ? 1 : 0,
    });
  }

  @override
  Future<void> updateFasting({
    required int fastingId,
    required LocalFastingModel localFasting,
  }) async {
    if (database == null) {
      throw Exception(
        'The database is not initialized. Check the instance on the dependency injection.',
      );
    }

    await database?.update(
      'fast_history',
      {
        'user_id': localFasting.userId,
        'date_start': localFasting.fastingDateStart.toIso8601String(),
        'date_end': localFasting.fastingDateEnd?.toIso8601String(),
        'is_current': localFasting.isCurrent ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [fastingId],
    );
  }

  @override
  Future<void> updateUser({
    required int userId,
    required LocalUserModel localUser,
  }) async {
    if (database == null) {
      throw Exception(
        'The database is not initialized. Check the instance on the dependency injection.',
      );
    }

    await database?.update(
      'users',
      {
        'username': localUser.userName,
        'birthdate': localUser.birthdate.toIso8601String(),
      },
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  @override
  Future<void> deleteFasting({required int fastingId}) async {
    if (database == null) {
      throw Exception(
        'The database is not initialized check the instance on the dependency injection',
      );
    }

    await database?.delete(
      'fast_history',
      where: 'id = ?',
      whereArgs: [fastingId],
    );
  }

  @override
  Future<void> deleteUser({required int userId}) async {
    if (database == null) {
      throw Exception(
        'The database is not initialized check the instance on the dependency injection',
      );
    }

    await database?.delete('users', where: 'user_id = ?', whereArgs: [userId]);
  }
}
