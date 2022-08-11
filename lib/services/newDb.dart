import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {

  static final _dbName = 'myDatabse.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';
  static final columnId = '_id';
  static final columnName1 = 'Year';
  static final columnName2 = 'Month';
  static final columnName3 = 'Date';

  static final DatabaseService databaseService = DatabaseService._internal();
  factory DatabaseService() => databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'flutter_sqflite_database.db');

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $_tableName($columnId INTEGER PRIMARY KEY, $columnName1 TEXT, $columnName2 TEXT ,$columnName3 TEXT)',
    );
  }

  Future<int?> insert(Map<String, dynamic> row) async {
    final db = await databaseService.database;

    return await db.insert(
      _tableName,
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<DateTime>> queryAll() async {
    final db = await databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    List<DateTime> n = [];
    for (dynamic i in maps) {
      n.add(DateTime(
          int.parse(i[DatabaseService.columnName1]),
          int.parse(i[DatabaseService.columnName2]),
          int.parse(i[DatabaseService.columnName3])));
    }
    return n;
  }

  Future<int?> update(Map<String, dynamic> row) async {
    final db = await databaseService.database;
    int id = row[columnId];
    return await db.update(
      _tableName,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int?> delete(int id) async {
    final db = await databaseService.database;

    return await db.delete(
      _tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
