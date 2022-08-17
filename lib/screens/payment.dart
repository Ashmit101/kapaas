import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapaas/screens/category/payment_category.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  List<Categories> categories = Utils.getCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payments",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(221, 29, 29, 29),
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
            margin: EdgeInsets.only(top: 20, right: 20, left:20),
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
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
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
