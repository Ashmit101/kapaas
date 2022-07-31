import 'package:flutter/material.dart';
import 'package:kapaas/database/db_helper.dart';
import '../entities/employees.dart';

DbHelper _dbHelper = DbHelper();

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  
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
        title: const Text('Employees'),
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