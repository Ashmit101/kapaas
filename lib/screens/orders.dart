import 'package:flutter/material.dart';
import 'package:kapaas/screens/category/order_category.dart';
import 'package:kapaas/database/tables.dart';
import 'package:kapaas/tiles/order_tile.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrdersState();
}

class _OrdersState extends State<OrderScreen> {
  List<Categories> categories = Utils.getCategories();

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
    var storedOrdersData = database.allOrdersEntries;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Orders",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          bool? succeeded =
              await Navigator.pushNamed(context, '/orders/form') as bool?;

          if (succeeded != null && succeeded == true) {
            // refreshData
            setState(() {});
          }
        }),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: storedOrdersData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                var orders = snapshot.data as List<Order>;
                if (orders.isNotEmpty) {
                  print(orders);
                  return ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: ((context, index) {
                        print("Index: $index");
                        return OrderTile(order: orders[index]);
                      }));
                }
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
