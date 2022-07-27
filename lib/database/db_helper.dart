import 'package:kapaas/entities/customer.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  late Database database;
  late String path;

  factory DbHelper() {
    return _instance;
  }

  DbHelper._internal() {
    // Initialize
    initializeDatabase();
  }

  void initializeDatabase() async {
    var databasePath = await getDatabasesPath();
    path = join(databasePath, 'data.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE customers (id INTEGER PRIMARY KEY, name varchar[20], phone varchar[10])');
      },
    );
  }

  Future<int> saveCustomer(Customer c) async {
    int id = await database.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO customers(name, phone) VALUES("${c.name}", ${c.contact})');
      return id;
    });
    return id;
  }

  Future<List<Map>> readCustomer() async {
    List<Map> list = await database.rawQuery('SELECT * FROM customers');
    return list;
  }

  void close() async {
    await database.close();
  }
}
