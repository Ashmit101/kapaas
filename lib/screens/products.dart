import 'package:flutter/material.dart';
import 'package:kapaas/database/db_helper.dart';
import '../entities/products.dart';

DbHelper _dbHelper = DbHelper();

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  
  var employeeMenuItems = <String>[
    'Add', 
    'Remove'
  ];

  void onSelect(item) {
    switch(item) {
      case 'Add':
        print('Add clicked');
        break;
      case 'Remove':
        print('Remove clicked');
        break;
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return employeeMenuItems.map((String choice) {
                    return PopupMenuItem<String>(
                      child: Text(choice),
                      value: choice,
                    );
                  }
                ).toList();
              }, 
              onSelected: onSelect,
            ),
        ],
        
      ),
    );
  }
}