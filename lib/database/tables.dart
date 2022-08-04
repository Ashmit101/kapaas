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

@DriftDatabase(tables: [Customers])
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
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
