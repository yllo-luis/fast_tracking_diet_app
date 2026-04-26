import 'package:fast_tracking_diet_app/domain/entity/fasting_routine_model.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_fasting_model.dart';
import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDatasourceContract {
  Future<void> onInitLocalDatasource();
  Future<void> createUser({required LocalUserModel localUser});
  Future<List<Map<String, Object?>>?> getUser({required String userName});

  Future<void> createFasting({
    required int userId,
    required LocalFastingModel localFasting,
  });
  Future<List<Map<String, Object?>>?> getFasting({required int userId});
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

  Future<void> addFastingRoutine({required FastingRoutineModel fastingModel});
  Future<List<Map<String, Object?>>?> getFastingRoutines();
  Future<void> removeFastingRoute({required int fastingRoutineId});
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

        await db.execute('''CREATE TABLE fasting_routines (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          fasting_period_ms INTEGER NOT NULL,
          fasting_rest_period_ms INTEGER NOT NULL,
          is_custom INTEGER NOT NULL CHECK (is_custom IN (0, 1))
        );''');

        /// Adding 18:6 fasting routine.
        await db.execute(
          '''INSERT INTO fasting_routines (fasting_period_ms, fasting_rest_period_ms, is_custom) 
          VALUES (64800000, 21600000, 0);''',
        );

        /// Adding 12:12 fasting routine.
        await db.execute(
          '''INSERT INTO fasting_routines (fasting_period_ms, fasting_rest_period_ms, is_custom) 
          VALUES (43200000, 43200000, 0);''',
        );

        /// Adding 16:8 fasting routine.
        await db.execute(
          '''INSERT INTO fasting_routines (fasting_period_ms, fasting_rest_period_ms, is_custom) 
          VALUES (57600000, 28800000, 0);''',
        );

        /// Adding 11:13 fasting routine.
        await db.execute(
          '''INSERT INTO fasting_routines (fasting_period_ms, fasting_rest_period_ms, is_custom) 
          VALUES (39600000, 46800000, 0);''',
        );
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
  Future<List<Map<String, Object?>>?> getUser({
    required String userName,
  }) async {
    if (database == null) {
      throw Exception(
        'The database is not initialized check the instance on the dependency injection',
      );
    }

    final result = await database?.query(
      'users',
      where: 'username = ?',
      whereArgs: [userName],
    );

    return result;
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
  Future<List<Map<String, Object?>>?> getFasting({required int userId}) async {
    if (database == null) {
      throw Exception(
        'The database is not initialized check the instance on the dependency injection',
      );
    }

    final result = await database?.query(
      'fast_history',
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    return result;
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

  @override
  Future<void> addFastingRoutine({
    required FastingRoutineModel fastingModel,
  }) async {
    if (database == null) {
      throw Exception(
        'The database is not initialized check the instance on the dependency injection',
      );
    }

    await database?.insert('fasting_routines', {
      'fasting_period_ms': fastingModel.fastingRestPeriod.inMilliseconds,
      'fasting_rest_period_ms': fastingModel.fastingRestPeriod.inMilliseconds,
      'is_custom': fastingModel.isCustom ? 1 : 0,
    });
  }

  @override
  Future<void> removeFastingRoute({required int fastingRoutineId}) async {
    if (database == null) {
      throw Exception(
        'The database is not initialized check the instance on the dependency injection',
      );
    }

    await database?.delete(
      'fasting_routines',
      where: 'id = ?',
      whereArgs: [fastingRoutineId],
    );
  }

  @override
  Future<List<Map<String, Object?>>?> getFastingRoutines() async {
    if (database == null) {
      throw Exception(
        'The database is not initialized check the instance on the dependency injection',
      );
    }

    final result = await database?.query(
      'fasting_routines',
    );

    return result;
  }
}
