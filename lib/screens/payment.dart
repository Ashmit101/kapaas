import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapaas/database/tables.dart';
import 'package:kapaas/screens/category/payment_category.dart';
import 'package:provider/provider.dart';

import '../tiles/order_tile.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  List<Categories> categories = Utils.getCategories();
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<KapaasDatabase>(context);
    var storedOrdersData = database.allOrdersEntries;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payments",
          style: TextStyle(color: Colors.white),
        ),
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
                        return OrderTile(
                          order: orders[index],
                          isForPayment: true,
                        );
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

  Widget getBody() {
    return Scaffold(
        body: ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Container(
            margin: EdgeInsets.only(top: 20, right: 20, left: 20),
            height: 140,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 236, 234, 234)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: Container(
                      child: (Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categories[index].orderName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'order_id: ${categories[index].orderId}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'payment_id: ${categories[index].paymentId}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Total: Rs ${categories[index].total}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 80,
                            // shape: RoundedRectangleBorder(
                            // borderRadius: BorderRadius.circular(20)),
                            child: const Text(
                              "Paid",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))),
                )
              ],
            ));
      },
    ));
  }
}
