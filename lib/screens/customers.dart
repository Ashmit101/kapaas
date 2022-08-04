import 'package:flutter/material.dart';
// import 'package:kapaas/database/db_helper.dart';
import 'package:kapaas/database/tables.dart';
import 'package:kapaas/tiles/customer_tile.dart';
import 'package:provider/provider.dart';

// import '../entities/customer.dart

// DbHelper _dbHelper = DbHelper();

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  // Future<List<Map>> storedCustomersData = Provider.of<KapaasDatabase>(context);

  final Widget circularProgress = const Center(
    child: CircularProgressIndicator(),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<KapaasDatabase>(context);
    var storedCustomersData = database.allCustomerEntries;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          //DO something
          bool succeeded =
              await Navigator.pushNamed(context, '/customers/form') as bool;

          if (succeeded) {
            refreshCustomerData();
          }
        }),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: storedCustomersData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //Future has completed
            if (snapshot.hasData) {
              List<Customer> customers = snapshot.data as List<Customer>;
              //Display the list of customers
              return ListView.builder(
                itemCount: customers.length,
                itemBuilder: (context, index) {
                  // var customer = Customer.fromMap(customers[index]);
                  var customer = customers[index];
                  return CustomerTile(
                      id: customer.id!,
                      name: customer.name,
                      contact: customer.phone);
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('There was an error getting the stored data!'),
              );
            } else {
              return circularProgress;
            }
          } else {
            //Future is still loading
            return circularProgress;
          }
        },
      ),
    );
  }

  void refreshCustomerData() {
    setState(() {
      // re fetch data
    });
  }
}
