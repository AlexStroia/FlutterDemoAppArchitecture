import 'package:dartz/dartz.dart';
import 'package:demo_app_architecture/core/domain/model/database_failure.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseClient<T> {
  Database? _database;
  bool _isInitialized = false;

  Future<void> _initialize(String tableName) async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'demo.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) =>
          _createDatabase(database, version, tableName),
    );
    _isInitialized = true;
  }

  Future<void> _createDatabase(
      Database db, int version, String tableName) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        id TEXT,
        tags TEXT,
        owner TEXT,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');
  }

  Future<Either<DatabaseFailure, List<Map<String, dynamic>>>> getAll(
      String tableName) async {
    if (!_isInitialized) {
      await _initialize(
        tableName,
      ); // Call initialize if not initialized
    }

    try {
      return Right(await _database!.query(tableName));
    } catch (e) {
      return const Left(DatabaseFailure.unknown());
    }
  }

  Future<Either<DatabaseFailure, int>> add(
      String tableName, dynamic data) async {
    if (!_isInitialized) {
      await _initialize(
        tableName,
      ); // Call initialize if not initialized
    }

    try {
      if (data is List) {
        final batch = _database!.batch();
        for (final item in data) {
          batch.insert(tableName, item,
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        final results = await batch.commit();
        return Right(results.length);
      } else if (data is Map<String, dynamic>) {
        final result = await _database!.insert(tableName, data,
            conflictAlgorithm: ConflictAlgorithm.replace);
        return Right(result);
      } else {
        return const Left(DatabaseFailure.unknown());
      }
    } catch (e) {
      return const Left(DatabaseFailure.unknown());
    }
  }

  Future<Either<DatabaseFailure, int>> update(
      String tableName, Map<String, dynamic> body, String id) async {
    if (!_isInitialized) {
      await _initialize(tableName); // Call initialize if not initialized
    }

    try {
      return Right(await _database!.update(
        tableName,
        body,
        where: 'id = ?',
        whereArgs: [id],
      ));
    } catch (e) {
      return const Left(DatabaseFailure.unknown());
    }
  }

  Future<Either<DatabaseFailure, int>> delete(String tableName, int id) async {
    if (!_isInitialized) {
      await _initialize(
        tableName,
      ); // Call initialize if not initialized
    }

    try {
      return Right(await _database!.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      ));
    } catch (e) {
      return const Left(DatabaseFailure.unknown());
    }
  }
}
