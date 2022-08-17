import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapaas/screens/category/order_category.dart';
import 'package:kapaas/database/tables.dart';
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
        backgroundColor: const Color.fromARGB(221, 29, 29, 29),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          bool? succeeded =
              await Navigator.pushNamed(context, '/orders/form') as bool?;

          if (succeeded != null && succeeded == true) {
            // refreshData
          }
        }),
        child: const Icon(Icons.add),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
        body: ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Container(
            margin: const EdgeInsets.only(top: 10, right: 10, left:10),
            height: 120,
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Order Date: 2022-08-24',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                ),
                          ),
                          Text(
                            'Deadline: 2022-08-24',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                ),
                          )
                        ],
                      ),
                    ],
                  ))),
                )
              ],
            ));
      },
    ));
  }
}
