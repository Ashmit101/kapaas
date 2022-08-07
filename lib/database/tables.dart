import 'dart:async';

import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'tables.g.dart';

class Customers extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get name => text().withLength(max: 32)();
  TextColumn get phone => text().withLength(max: 10)();
}

class Products extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get name => text().withLength(max: 10)();
  IntColumn get price => integer()();
}

class Orders extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  DateTimeColumn get deadline => dateTime()();
  IntColumn get productId => integer().references(Products, #id)();
  IntColumn get customerId => integer().references(Customers, #id)();
}

class Measurements extends Table {
  IntColumn get customerId => integer()();
  RealColumn get neck => real()();
  RealColumn get waist => real()();
  RealColumn get arm => real()();
  RealColumn get hip => real()();
  RealColumn get wrist => real()();
}

class Employees extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  RealColumn get salary => real()();
}

@DriftDatabase(tables: [Customers, Products, Orders, Measurements, Employees])
class KapaasDatabase extends _$KapaasDatabase {
  //Tell the database where to store the data with this constructor
  KapaasDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //Customers commands
  Future<List<Customer>> get allCustomerEntries => select(customers).get();
  Future insertCustomer(Customer customer) => into(customers).insert(customer);
  Future updateCustomer(Customer customer) =>
      update(customers).replace(customer);
  Future deleteCustomer(Customer customer) =>
      delete(customers).delete(customer);

  Future<List<Product>> get allProductsEntries => select(products).get();
  Future insertProduct(Product product) => into(products).insert(product);
  Future updateProduct(Product product) => update(products).replace(product);
  Future deleteProduct(Product product) => delete(products).delete(product);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
