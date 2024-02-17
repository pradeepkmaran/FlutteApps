import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<Database>get database async{
    if(_database!=null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async{
    String path = join(await getDatabasesPath(), 'users_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async{
    await db.execute('CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)');
    await db.execute('CREATE TABLE IF NOT EXISTS food_menu(id INTEGER PRIMARY KEY AUTOINCREMENT, item_name TEXT, price TEXT)');
  }

  Future<int> insertUser(Map<String, dynamic> row) async{
    Database db = await instance.database;
    return await db.insert('users', row);
  }

  Future<List<Map<String, dynamic>>> queryUsers() async {
    Database db = await instance.database;
    return await db.query('users');
  }

  Future<List<Map<String, dynamic>>> querySingleUser(String email, String password) async {
    Database db = await instance.database;
    return await db.query('users', where: 'email =? AND password =?', whereArgs: [email, password]);
  }
}