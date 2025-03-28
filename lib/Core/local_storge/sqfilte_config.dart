import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../model/recipec.dart';

class SqfliteConfg {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initalDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> _initalDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'recipes.db');
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 2,
      onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        ALTER TABLE recipes ADD COLUMN isFavorite INTEGER DEFAULT 0;
      ''');
    }
  }

  _onCreate(Database db, int version) async {
    await db.execute("""
      CREATE TABLE recipes (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        category TEXT NOT NULL,
        image TEXT,
        isFavorite INTEGER DEFAULT 0
      )
    """);
  }

  Future<int> insertRecipe(RecipeModel recipe) async {
    Database? mydb = await db;
    return await mydb!.insert("recipes", recipe.toMap());
  }

  Future<List<RecipeModel>> getRecipesByCategory(String category) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.query(
      "recipes",
      where: "category = ?",
      whereArgs: [category],
    );
    return response.map((map) => RecipeModel.fromMap(map)).toList();
  }

  Future<int> updateRecipe(RecipeModel recipe) async {
    Database? mydb = await db;
    return await mydb!.update(
      "recipes",
      recipe.toMap(),
      where: "id = ?",
      whereArgs: [recipe.id],
    );
  }

  Future<int> deleteRecipe(int id) async {
    Database? mydb = await db;
    return await mydb!.delete("recipes", where: "id = ?", whereArgs: [id]);
  }

  /// ✅ **1️⃣ التبديل بين التفضيل**
  Future<void> toggleFavorite(int id, bool isFavorite) async {
    Database? mydb = await db;
    await mydb!.update(
      "recipes",
      {"isFavorite": isFavorite ? 1 : 0},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /// ✅ **2️⃣ جلب الوصفات المفضلة**
  Future<List<RecipeModel>> getFavoriteRecipes() async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.query(
      "recipes",
      where: "isFavorite = ?",
      whereArgs: [1], // استرجاع فقط المفضلة
    );
    return response.map((map) => RecipeModel.fromMap(map)).toList();
  }
}
