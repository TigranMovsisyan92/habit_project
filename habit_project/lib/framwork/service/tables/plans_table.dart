import 'package:habit_project/models/plan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PlansTable {
  static final PlansTable _instance = PlansTable._internal();
  factory PlansTable() => _instance;
  PlansTable._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Инициализация базы данных
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'plans.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Создание таблицы
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE plans(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        emoji TEXT,
        emojiName TEXT
      )
    ''');
  }

  // Вставка новой задачи
  Future<void> insertPlans(PlanModel plan) async {
    final db = await database;
    await db.insert(
      'plans',
      plan.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Получение всех задач
  Future<List<PlanModel>> getPlans() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('plans');
    return List.generate(maps.length, (i) {
      return PlanModel.fromMap(maps[i]);
    });
  }

  // Обновление задачи
  Future<void> updatePlan(PlanModel plan) async {
    final db = await database;
    await db.update(
      'plans',
      plan.toMap(),
      where: 'id = ?',
      whereArgs: [plan.id],
    );
  }

  // Удаление задачи
  Future<void> deletePlan(int id) async {
    final db = await database;
    await db.delete(
      'plans',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
