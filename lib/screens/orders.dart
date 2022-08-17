import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kapaas/database/tables.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<KapaasDatabase>(context);
    Future<List<Order>> storedOrdersData = database.allOrdersEntries;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: FutureBuilder(
        future: storedOrdersData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //Future completed
            if (snapshot.hasData) {
              final orders = snapshot.data as List<
                  Order>; //Get the data from the snapshot as list of orders

              if (orders.isNotEmpty) {
                // Print all the orders in the 'orders' list
                return Center(
                  child: Text('Number of orders stored: ${orders.length}'),
                );
              } else {
                return const Center(
                  // In case there are no orders in the list, notify the user
                  child: Text('No order available'),
                );
              }
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void printOrders(KapaasDatabase database) async {
    List<Order> storedOrders = await database.allOrdersEntries;
    print('The stored orders are : \n $storedOrders');
  }
}
