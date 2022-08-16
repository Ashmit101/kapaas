// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Customer extends DataClass implements Insertable<Customer> {
  final int? id;
  final String name;
  final String phone;
  Customer({this.id, required this.name, required this.phone});
  factory Customer.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Customer(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      phone: Value(phone),
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
    };
  }

  Customer copyWith({int? id, String? name, String? phone}) => Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
      );
  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int?> id;
  final Value<String> name;
  final Value<String> phone;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String phone,
  })  : name = Value(name),
        phone = Value(phone);
  static Insertable<Customer> custom({
    Expression<int?>? id,
    Expression<String>? name,
    Expression<String>? phone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
    });
  }

  CustomersCompanion copyWith(
      {Value<int?>? id, Value<String>? name, Value<String>? phone}) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, phone];
  @override
  String get aliasedName => _alias ?? 'customers';
  @override
  String get actualTableName => 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<Customer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Customer.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final int? id;
  final DateTime deadline;
  final int productId;
  final int customerId;
  Order(
      {this.id,
      required this.deadline,
      required this.productId,
      required this.customerId});
  factory Order.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Order(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      deadline: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deadline'])!,
      productId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}product_id'])!,
      customerId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}customer_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['deadline'] = Variable<DateTime>(deadline);
    map['product_id'] = Variable<int>(productId);
    map['customer_id'] = Variable<int>(customerId);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      deadline: Value(deadline),
      productId: Value(productId),
      customerId: Value(customerId),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int?>(json['id']),
      deadline: serializer.fromJson<DateTime>(json['deadline']),
      productId: serializer.fromJson<int>(json['productId']),
      customerId: serializer.fromJson<int>(json['customerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'deadline': serializer.toJson<DateTime>(deadline),
      'productId': serializer.toJson<int>(productId),
      'customerId': serializer.toJson<int>(customerId),
    };
  }

  Order copyWith(
          {int? id, DateTime? deadline, int? productId, int? customerId}) =>
      Order(
        id: id ?? this.id,
        deadline: deadline ?? this.deadline,
        productId: productId ?? this.productId,
        customerId: customerId ?? this.customerId,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('deadline: $deadline, ')
          ..write('productId: $productId, ')
          ..write('customerId: $customerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, deadline, productId, customerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.deadline == this.deadline &&
          other.productId == this.productId &&
          other.customerId == this.customerId);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int?> id;
  final Value<DateTime> deadline;
  final Value<int> productId;
  final Value<int> customerId;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.deadline = const Value.absent(),
    this.productId = const Value.absent(),
    this.customerId = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required DateTime deadline,
    required int productId,
    required int customerId,
  })  : deadline = Value(deadline),
        productId = Value(productId),
        customerId = Value(customerId);
  static Insertable<Order> custom({
    Expression<int?>? id,
    Expression<DateTime>? deadline,
    Expression<int>? productId,
    Expression<int>? customerId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deadline != null) 'deadline': deadline,
      if (productId != null) 'product_id': productId,
      if (customerId != null) 'customer_id': customerId,
    });
  }

  OrdersCompanion copyWith(
      {Value<int?>? id,
      Value<DateTime>? deadline,
      Value<int>? productId,
      Value<int>? customerId}) {
    return OrdersCompanion(
      id: id ?? this.id,
      deadline: deadline ?? this.deadline,
      productId: productId ?? this.productId,
      customerId: customerId ?? this.customerId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('deadline: $deadline, ')
          ..write('productId: $productId, ')
          ..write('customerId: $customerId')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _deadlineMeta = const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime?> deadline = GeneratedColumn<DateTime?>(
      'deadline', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _productIdMeta = const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int?> productId = GeneratedColumn<int?>(
      'product_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _customerIdMeta = const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int?> customerId = GeneratedColumn<int?>(
      'customer_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES customers (id)');
  @override
  List<GeneratedColumn> get $columns => [id, deadline, productId, customerId];
  @override
  String get aliasedName => _alias ?? 'orders';
  @override
  String get actualTableName => 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    } else if (isInserting) {
      context.missing(_deadlineMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Order.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class Measurement extends DataClass implements Insertable<Measurement> {
  final int customerId;
  final double neck;
  final double waist;
  final double arm;
  final double hip;
  final double wrist;
  Measurement(
      {required this.customerId,
      required this.neck,
      required this.waist,
      required this.arm,
      required this.hip,
      required this.wrist});
  factory Measurement.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Measurement(
      customerId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}customer_id'])!,
      neck: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}neck'])!,
      waist: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}waist'])!,
      arm: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}arm'])!,
      hip: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hip'])!,
      wrist: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}wrist'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['customer_id'] = Variable<int>(customerId);
    map['neck'] = Variable<double>(neck);
    map['waist'] = Variable<double>(waist);
    map['arm'] = Variable<double>(arm);
    map['hip'] = Variable<double>(hip);
    map['wrist'] = Variable<double>(wrist);
    return map;
  }

  MeasurementsCompanion toCompanion(bool nullToAbsent) {
    return MeasurementsCompanion(
      customerId: Value(customerId),
      neck: Value(neck),
      waist: Value(waist),
      arm: Value(arm),
      hip: Value(hip),
      wrist: Value(wrist),
    );
  }

  factory Measurement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Measurement(
      customerId: serializer.fromJson<int>(json['customerId']),
      neck: serializer.fromJson<double>(json['neck']),
      waist: serializer.fromJson<double>(json['waist']),
      arm: serializer.fromJson<double>(json['arm']),
      hip: serializer.fromJson<double>(json['hip']),
      wrist: serializer.fromJson<double>(json['wrist']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'customerId': serializer.toJson<int>(customerId),
      'neck': serializer.toJson<double>(neck),
      'waist': serializer.toJson<double>(waist),
      'arm': serializer.toJson<double>(arm),
      'hip': serializer.toJson<double>(hip),
      'wrist': serializer.toJson<double>(wrist),
    };
  }

  Measurement copyWith(
          {int? customerId,
          double? neck,
          double? waist,
          double? arm,
          double? hip,
          double? wrist}) =>
      Measurement(
        customerId: customerId ?? this.customerId,
        neck: neck ?? this.neck,
        waist: waist ?? this.waist,
        arm: arm ?? this.arm,
        hip: hip ?? this.hip,
        wrist: wrist ?? this.wrist,
      );
  @override
  String toString() {
    return (StringBuffer('Measurement(')
          ..write('customerId: $customerId, ')
          ..write('neck: $neck, ')
          ..write('waist: $waist, ')
          ..write('arm: $arm, ')
          ..write('hip: $hip, ')
          ..write('wrist: $wrist')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(customerId, neck, waist, arm, hip, wrist);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Measurement &&
          other.customerId == this.customerId &&
          other.neck == this.neck &&
          other.waist == this.waist &&
          other.arm == this.arm &&
          other.hip == this.hip &&
          other.wrist == this.wrist);
}

class MeasurementsCompanion extends UpdateCompanion<Measurement> {
  final Value<int> customerId;
  final Value<double> neck;
  final Value<double> waist;
  final Value<double> arm;
  final Value<double> hip;
  final Value<double> wrist;
  const MeasurementsCompanion({
    this.customerId = const Value.absent(),
    this.neck = const Value.absent(),
    this.waist = const Value.absent(),
    this.arm = const Value.absent(),
    this.hip = const Value.absent(),
    this.wrist = const Value.absent(),
  });
  MeasurementsCompanion.insert({
    required int customerId,
    required double neck,
    required double waist,
    required double arm,
    required double hip,
    required double wrist,
  })  : customerId = Value(customerId),
        neck = Value(neck),
        waist = Value(waist),
        arm = Value(arm),
        hip = Value(hip),
        wrist = Value(wrist);
  static Insertable<Measurement> custom({
    Expression<int>? customerId,
    Expression<double>? neck,
    Expression<double>? waist,
    Expression<double>? arm,
    Expression<double>? hip,
    Expression<double>? wrist,
  }) {
    return RawValuesInsertable({
      if (customerId != null) 'customer_id': customerId,
      if (neck != null) 'neck': neck,
      if (waist != null) 'waist': waist,
      if (arm != null) 'arm': arm,
      if (hip != null) 'hip': hip,
      if (wrist != null) 'wrist': wrist,
    });
  }

  MeasurementsCompanion copyWith(
      {Value<int>? customerId,
      Value<double>? neck,
      Value<double>? waist,
      Value<double>? arm,
      Value<double>? hip,
      Value<double>? wrist}) {
    return MeasurementsCompanion(
      customerId: customerId ?? this.customerId,
      neck: neck ?? this.neck,
      waist: waist ?? this.waist,
      arm: arm ?? this.arm,
      hip: hip ?? this.hip,
      wrist: wrist ?? this.wrist,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (neck.present) {
      map['neck'] = Variable<double>(neck.value);
    }
    if (waist.present) {
      map['waist'] = Variable<double>(waist.value);
    }
    if (arm.present) {
      map['arm'] = Variable<double>(arm.value);
    }
    if (hip.present) {
      map['hip'] = Variable<double>(hip.value);
    }
    if (wrist.present) {
      map['wrist'] = Variable<double>(wrist.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeasurementsCompanion(')
          ..write('customerId: $customerId, ')
          ..write('neck: $neck, ')
          ..write('waist: $waist, ')
          ..write('arm: $arm, ')
          ..write('hip: $hip, ')
          ..write('wrist: $wrist')
          ..write(')'))
        .toString();
  }
}

class $MeasurementsTable extends Measurements
    with TableInfo<$MeasurementsTable, Measurement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeasurementsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _customerIdMeta = const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int?> customerId = GeneratedColumn<int?>(
      'customer_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _neckMeta = const VerificationMeta('neck');
  @override
  late final GeneratedColumn<double?> neck = GeneratedColumn<double?>(
      'neck', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _waistMeta = const VerificationMeta('waist');
  @override
  late final GeneratedColumn<double?> waist = GeneratedColumn<double?>(
      'waist', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _armMeta = const VerificationMeta('arm');
  @override
  late final GeneratedColumn<double?> arm = GeneratedColumn<double?>(
      'arm', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _hipMeta = const VerificationMeta('hip');
  @override
  late final GeneratedColumn<double?> hip = GeneratedColumn<double?>(
      'hip', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _wristMeta = const VerificationMeta('wrist');
  @override
  late final GeneratedColumn<double?> wrist = GeneratedColumn<double?>(
      'wrist', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [customerId, neck, waist, arm, hip, wrist];
  @override
  String get aliasedName => _alias ?? 'measurements';
  @override
  String get actualTableName => 'measurements';
  @override
  VerificationContext validateIntegrity(Insertable<Measurement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('neck')) {
      context.handle(
          _neckMeta, neck.isAcceptableOrUnknown(data['neck']!, _neckMeta));
    } else if (isInserting) {
      context.missing(_neckMeta);
    }
    if (data.containsKey('waist')) {
      context.handle(
          _waistMeta, waist.isAcceptableOrUnknown(data['waist']!, _waistMeta));
    } else if (isInserting) {
      context.missing(_waistMeta);
    }
    if (data.containsKey('arm')) {
      context.handle(
          _armMeta, arm.isAcceptableOrUnknown(data['arm']!, _armMeta));
    } else if (isInserting) {
      context.missing(_armMeta);
    }
    if (data.containsKey('hip')) {
      context.handle(
          _hipMeta, hip.isAcceptableOrUnknown(data['hip']!, _hipMeta));
    } else if (isInserting) {
      context.missing(_hipMeta);
    }
    if (data.containsKey('wrist')) {
      context.handle(
          _wristMeta, wrist.isAcceptableOrUnknown(data['wrist']!, _wristMeta));
    } else if (isInserting) {
      context.missing(_wristMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Measurement map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Measurement.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MeasurementsTable createAlias(String alias) {
    return $MeasurementsTable(attachedDatabase, alias);
  }
}

class Employee extends DataClass implements Insertable<Employee> {
  final int? id;
  final double salary;
  final String name;
  Employee({this.id, required this.salary, required this.name});
  factory Employee.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Employee(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      salary: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}salary'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['salary'] = Variable<double>(salary);
    map['name'] = Variable<String>(name);
    return map;
  }

  EmployeesCompanion toCompanion(bool nullToAbsent) {
    return EmployeesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      salary: Value(salary),
      name: Value(name),
    );
  }

  factory Employee.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Employee(
      id: serializer.fromJson<int?>(json['id']),
      salary: serializer.fromJson<double>(json['salary']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'salary': serializer.toJson<double>(salary),
      'name': serializer.toJson<String>(name),
    };
  }

  Employee copyWith({int? id, double? salary, String? name}) => Employee(
        id: id ?? this.id,
        salary: salary ?? this.salary,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Employee(')
          ..write('id: $id, ')
          ..write('salary: $salary, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, salary, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Employee &&
          other.id == this.id &&
          other.salary == this.salary &&
          other.name == this.name);
}

class EmployeesCompanion extends UpdateCompanion<Employee> {
  final Value<int?> id;
  final Value<double> salary;
  final Value<String> name;
  const EmployeesCompanion({
    this.id = const Value.absent(),
    this.salary = const Value.absent(),
    this.name = const Value.absent(),
  });
  EmployeesCompanion.insert({
    this.id = const Value.absent(),
    required double salary,
    required String name,
  })  : salary = Value(salary),
        name = Value(name);
  static Insertable<Employee> custom({
    Expression<int?>? id,
    Expression<double>? salary,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (salary != null) 'salary': salary,
      if (name != null) 'name': name,
    });
  }

  EmployeesCompanion copyWith(
      {Value<int?>? id, Value<double>? salary, Value<String>? name}) {
    return EmployeesCompanion(
      id: id ?? this.id,
      salary: salary ?? this.salary,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (salary.present) {
      map['salary'] = Variable<double>(salary.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeesCompanion(')
          ..write('id: $id, ')
          ..write('salary: $salary, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $EmployeesTable extends Employees
    with TableInfo<$EmployeesTable, Employee> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _salaryMeta = const VerificationMeta('salary');
  @override
  late final GeneratedColumn<double?> salary = GeneratedColumn<double?>(
      'salary', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, salary, name];
  @override
  String get aliasedName => _alias ?? 'employees';
  @override
  String get actualTableName => 'employees';
  @override
  VerificationContext validateIntegrity(Insertable<Employee> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('salary')) {
      context.handle(_salaryMeta,
          salary.isAcceptableOrUnknown(data['salary']!, _salaryMeta));
    } else if (isInserting) {
      context.missing(_salaryMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Employee map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Employee.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EmployeesTable createAlias(String alias) {
    return $EmployeesTable(attachedDatabase, alias);
  }
}

abstract class _$KapaasDatabase extends GeneratedDatabase {
  _$KapaasDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $MeasurementsTable measurements = $MeasurementsTable(this);
  late final $EmployeesTable employees = $EmployeesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [customers, orders, measurements, employees];
}
