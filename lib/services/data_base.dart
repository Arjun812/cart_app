import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import '../pages/cart/model/cart_model.dart';
import '../utils/constants/constants.dart';
class Sql {
  database() async {
    return openDatabase(
      path.join(await getDatabasesPath(), Base.db),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE ${CartDB.cartTable}(KEY INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,${CartDB.id} TEXT, ${CartDB.price} REAL,${CartDB.quantity} INTEGER,${CartDB.productName} TEXT, ${CartDB.image} TEXT)');
      },
      version: 1,
    );
  }
}

class CartProductDb {
  Future insertProduct(CartProduct product) async {
    final db = await Sql().database();
    await db.insert(
      CartDB.cartTable,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(await db.query(CartDB.cartTable));

  }
}

Future<void> deleteProduct(int key) async {
  final db = await Sql().database();
  await db.delete(CartDB.cartTable, where: ' ${CartDB.key}=?', whereArgs: [key]);
}

Future<int> update({int? key, int? quantity}) async {
  final db = await Sql().database();
  final int status =
  await db.rawUpdate('UPDATE ${CartDB.cartTable} SET ${CartDB.quantity}=? WHERE ${CartDB.key}=?', [quantity, key]);
  return Future.value(status);
}

Future<int> count() async {
  final db = await Sql().database();
  final List<Map<String, dynamic>> maps = await db.query(CartDB.cartTable);
  return Future.value(maps.length);
}

Future<List<CartProduct>> getProduct({String? productId}) async {
  final db = await Sql().database();
  List<Map<String, dynamic>> maps;
  if (productId == null)
    maps = await db.query(CartDB.cartTable);
  else {
    maps = await db.query(CartDB.cartTable, where: '${CartDB.id}=?', whereArgs: [productId]);
  }
  print(maps);
  return List.generate(
    maps.length,
        (i) {
      return CartProduct(
        key: maps[i][CartDB.key],
        image: maps[i][CartDB.image],
        id: maps[i][CartDB.id],
        productName: maps[i][CartDB.productName],
        price: double.tryParse(maps[i][CartDB.price]!.toString())!,
        quantity: maps[i][CartDB.quantity],
      );
    },
  );
}