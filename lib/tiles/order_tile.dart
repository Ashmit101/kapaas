import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kapaas/database/tables.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class OrderTile extends StatefulWidget {
  final Order order;
  final bool isForPayment;

  const OrderTile({Key? key, required this.order, this.isForPayment = false})
      : super(key: key);

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  String getProperDate(DateTime dt) {
    return DateFormat('yyyy-MM-dd').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    // Get database
    final database = Provider.of<KapaasDatabase>(context);

    // Order displayed by this widget
    Order currentOrder = widget.order;

    //Details of the order
    var customer = database.getCustomer(currentOrder.customerId);
    var productId = currentOrder.productId;
    var orderedDate = currentOrder.orderDate;
    var deadline = currentOrder.deadline;
    var orderId = currentOrder.id;
    var paid = currentOrder.paid;
    String paymentStatus = '';

    //Getting proper string for the datet and time
    var orderedDateString = getProperDate(orderedDate);
    var deadlineString = getProperDate(deadline);

    // Check if it is for the payment page
    var isPayment = widget.isForPayment;

    // Get the paid status if it is for payment
    if (isPayment) {
      if (paid) {
        paymentStatus = "Paid";
      } else {
        paymentStatus = "Unpaid";
      }
    }

    return Container(
        margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
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
                    color: const Color.fromARGB(255, 236, 234, 234)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Container(
                  child: (Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                          future: customer,
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                var customerList =
                                    snapshot.data as List<Customer>;
                                var customerItem = customerList[0];

                                return Text(
                                  customerItem.name,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                );
                              } else {
                                return const Text('Error getting the name');
                              }
                            }
                            return const Text('Getting the data...');
                          })),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Order ID: $orderId',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Order Date: $orderedDateString',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Deadline: $deadlineString',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: isPayment,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                      decoration: BoxDecoration(
                        color: paid ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          updateOrderPaymentStatus(database, currentOrder);
                          Navigator.popAndPushNamed(context, '/payment');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          // shape: RoundedRectangleBorder(
                          // borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            paymentStatus,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ))),
            )
          ],
        ));
  }

  void updateOrderPaymentStatus(KapaasDatabase database, Order currentOrder) {
    Order newOrder = Order(
        id: currentOrder.id,
        orderDate: currentOrder.orderDate,
        deadline: currentOrder.deadline,
        productId: currentOrder.productId,
        paid: !currentOrder.paid,
        customerId: currentOrder.customerId);
    database.updateOrder(newOrder);
  }
}
