import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper.internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE my_table (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER
      )
    ''');
    // final dbHelper = DatabaseHelper();
    // final db = await dbHelper.database;

// Insertar datos
    await db.insert('my_table', {'name': 'John', 'age': 30});

// Consultar datos
    final data = await db.query('my_table');
    print(data);

// Actualizar datos
    await db.update('my_table', {'age': 31},
        where: 'name = ?', whereArgs: ['John']);

// Eliminar datos
    await db.delete('my_table', where: 'name = ?', whereArgs: ['John']);
  }
}
