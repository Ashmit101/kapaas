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
  Future<List<Customer>> get allCustomerEntries =>
      select(customers).get(); // Get all the stored customers
  Future insertCustomer(Customer customer) =>
      into(customers).insert(customer); // Insert a new customer
  Future updateCustomer(Customer customer) =>
      update(customers).replace(customer); // Update an existing customer
  Future deleteCustomer(Customer customer) =>
      delete(customers).delete(customer); // Delete a customer

  // Orders commands
  Future<List<Order>> get allOrdersEntries =>
      select(orders).get(); // Get all the stored orders
  Future insertOrder(Order order) =>
      into(orders).insert(order); // Insert a new order
  Future updateOrder(Order order) =>
      update(orders).replace(order); // Update an existing order
  Future deleteOrder(Order order) =>
      delete(orders).delete(order); // Delete an order

  //Measurements commands
  Future<List<Measurement>> get allMeasurementEntries =>
      select(measurements).get(); // Get all the stored measurements
  Future insertMeasurement(Measurement measurement) =>
      into(measurements).insert(measurement); // Insert a new measurement
  Future updateMeasurement(Measurement measurement) => update(measurements)
      .replace(measurement); // Update an existing measurement
  Future deleteMeasurement(Measurement measurement) =>
      delete(measurements).delete(measurement); // Delete a measurement

  // Employees commands
  Future<List<Employee>> get allEmployeeEntries =>
      select(employees).get(); // Get all the stored employees
  Future insertEmployee(Employee employee) =>
      into(employees).insert(employee); // Insert a new employee
  Future updateEmployee(Employee employee) =>
      update(employees).replace(employee); // Update an existing employee
  Future deleteEmployee(Employee employee) =>
      delete(employees).delete(employee); // Delete a employee
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
