import 'dart:ui';
import 'package:flutter/material.dart';

class Categories {
  String orderName;
  int orderId;
  int paymentId;
  int total;

  Categories({
    required this.orderName,
    required this.orderId,
    required this.paymentId,
    required this.total,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        orderName: json['orderName'],
        orderId: json['orderId'],
        paymentId: json['paymenId'],
        total: json['total']);
  }
}

class Utils {
  static List<Categories> getCategories() {
    return [
      Categories(
        orderId: 34453,
        orderName: 'Ashmit',
        paymentId: 45637,
        total: 6778990
      ),
      Categories(
        orderId: 6675,
        orderName: 'Bibek',
        paymentId: 45637,
        total: 5637839
      ),
      Categories(
        orderId: 2356,
        orderName: 'Jeevan',
        paymentId: 5637,
        total: 893938
      ),

    ];
  }
}
