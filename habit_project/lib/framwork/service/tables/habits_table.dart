import 'package:habit_project/models/habit_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HabitsTable {
  static final HabitsTable _instance = HabitsTable._internal();
  factory HabitsTable() => _instance;
  HabitsTable._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'habits.db');
    return openDatabase(
      path,
      version: 2, // Increment version number to trigger onUpgrade
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE HabitModel (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        motivation TEXT,
        type TEXT,
        coment TEXT,
        startDate INTEGER,
        emoji TEXT,
        emojiName TEXT,
        notifications TEXT,
        components TEXT
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        ALTER TABLE HabitModel ADD COLUMN components TEXT
      ''');
    }
  }

  Future<void> insertHabit(HabitModel habit) async {
    final db = await database;
    await db.insert(
      'HabitModel',
      habit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<HabitModel>> getHabits() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('HabitModel');
    return List<HabitModel>.from(maps.map((map) => HabitModel.fromMap(map)));
  }

  Future<void> updateHabit(HabitModel habit) async {
    final db = await database;
    await db.update(
      'HabitModel',
      habit.toMap(),
      where: 'id = ?',
      whereArgs: [habit.id],
    );
  }

  Future<void> deleteHabit(int id) async {
    final db = await database;
    await db.delete(
      'HabitModel',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
