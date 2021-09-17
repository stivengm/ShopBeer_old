import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shop_beer/core/models/cart_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {

  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async => _database ??= await initDB();


  // Future<Database> get database async {
  //   if ( _database != null ) return _database!;

  //   _database = await initDB();

  //   return _database!;

  // }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print(documentsDirectory.path);
    final path = join(documentsDirectory.path, 'CartTest.db');
    print(path);
    
    // Crear base de datos
    return await openDatabase(path, version: 2, onOpen: (db) {},
    onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE Cart(
        id INTEGER PRIMARY KEY,
        title TEXT,
        imagen TEXT,
        price TEXT,
        cantidad TEXT
      )
      ''');
    });
  }

  Future<int> nuevoRegistro(CartModel cartModel) async {
    final db = await database;
    final res = await db.insert('Cart', cartModel.toJson());
    

    return res;
  }

  // Future<CartModel> getItemById(int id) async {
  //   final db = await database;
  //   final res = await db.query('Cart', where: 'id = ?', whereArgs: [id]);
  //   return res.isNotEmpty ? CartModel.fromJson(res.first) : [];
  // }

  Future <List<CartModel>> getAllItemsCart() async {
    final db = await database;
    final res = await db.query('Cart');

    return res.isNotEmpty
          ? res.map( (s) => CartModel.fromJson(s) ).toList()
          : [];
  }

  Future<int> updateItemsCart(CartModel id) async {
    final db = await database;
    final res = await db.update('Cart', id.toJson(), where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteItemsCart(int id) async {
    final db = await database;
    final res = await db.delete('Cart', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteAllItemdsCart() async {
    final db = await database;
    final res = await db.delete('Cart');
    return res;
  }

  

}