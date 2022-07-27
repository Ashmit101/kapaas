import 'package:flutter/material.dart';
import 'package:kapaas/database/db_helper.dart';

DbHelper _dbHelper = DbHelper();

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final Future<List<Map>> storedCustomersData = _dbHelper.readCustomer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(storedCustomersData);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          //DO something
          Navigator.pushNamed(context, '/customers/form');
        }),
        child: const Icon(Icons.add),
      ),
      // body: FutureBuilder(
      //   future: storedCustomersData,

      // ),
    );
  }
}
