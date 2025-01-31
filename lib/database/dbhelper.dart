import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();

    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "app_database.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT NOT NULL,
          email TEXT NOT NULL,
          password TEXT NOT NULL)''');
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await instance.database;
    return await db.insert(table, data);
  }

  // ✅ Retrieve all records from a table
  Future<List<Map<String, dynamic>>> getAll(String table) async {
    final db = await instance.database;
    return await db.query(table);
  }

  // ✅ Update a record in a table
  Future<int> update(
      String table, Map<String, dynamic> data, String column, int id) async {
    final db = await instance.database;
    return await db.update(table, data, where: "$column = ?", whereArgs: [id]);
  }

  // ✅ Delete a record from a table
  Future<int> delete(String table, String column, int id) async {
    final db = await instance.database;
    return await db.delete(table, where: "$column = ?", whereArgs: [id]);
  }

  String _hashPassword(String password) {
    final bytes = utf8.encode(password); // Convert password to bytes
    final hash = sha256.convert(bytes); // Hash the password
    return hash.toString(); // Convert to hex string
  }

  Future<int> registerUser(
      String username, String email, String password) async {
    final db = await instance.database;
    final hashedPassword = _hashPassword(password);
    return await db.insert('users', {
      'username': username,
      'email': email,
      'password': hashedPassword,
    });
  }

  // ✅ Authenticate user login
  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final db = await instance.database;
    final hashedPassword = _hashPassword(password); // ✅ Hash input before checking
    final List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email.trim(), hashedPassword],
    );

    if (users.isNotEmpty) {
      return users.first; // ✅ Return user data if found
    }
    return null; // ❌ Return null if no match
  }
}
