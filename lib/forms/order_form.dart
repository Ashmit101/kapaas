import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:kapaas/database/json/constants.dart';
import 'package:provider/provider.dart';
import '../database/tables.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  Customer? dropdownValue;

  int? customerId;
  int? productId;
  DateTime? deadline;

  // Booleans to check whether the required data has been selected
  var customerChosen = false;
  var productChosen = false;
  var deadlinePicked = false;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<KapaasDatabase>(context);

    var storedCustomersData = database.allCustomerEntries;
    var config = CalendarDatePicker2WithActionButtonsConfig();

    return FutureBuilder(
        future: storedCustomersData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasError) {
              List<Customer> customers = snapshot.data as List<Customer>;
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Enter order details'),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Choose a customer
                    DropdownButton<Customer>(
                      value: dropdownValue,
                      icon: const Icon(Icons.person),
                      onChanged: (value) {
                        print('Chosen customer : $value');
                        setState(() {
                          dropdownValue = value;
                        });
                        customerId = value?.id ?? 0;
                      },
                      hint: const Text('Customer'),
                      items: customers
                          .map<DropdownMenuItem<Customer>>((Customer value) {
                        return DropdownMenuItem<Customer>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                    ),

                    // Choose a product
                    Visibility(
                      visible: productChosen,
                      replacement: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            productId = await Navigator.pushNamed(
                                context, '/products',
                                arguments: true) as int?;
                            if (productId != null) {
                              print("Product chose : $productId");
                              setState(() {
                                productChosen = true;
                              });
                            }
                          },
                          child: Container(
                            child: Image(
                              image: AssetImage(
                                  ProductHelper.getProductResourceFromID(
                                      productId ?? 101)['imgUrl'] as String),
                            ),
                          ),
                        ),
                      ),
                      child: Text('Product id : $productId'),
                    ),
                    //Date Picker
                    Visibility(
                      visible: deadlinePicked,
                      replacement: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            var results = await showCalendarDatePicker2Dialog(
                                context: context,
                                config: config,
                                dialogSize: const Size(325, 400));
                            if (results != null && results.isNotEmpty) {
                              setState(() {
                                deadlinePicked = true;
                              });
                            }
                          },
                          child: const Text('Deadline'),
                        ),
                      ),
                      child: Text(
                          "Deadline: ${deadline.toString().replaceAll('00:00:00.000', '')}"),
                    ),
                    // Place the order
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (deadline != null &&
                              productId != null &&
                              customerId != null) {
                            final order = Order(
                                deadline: deadline as DateTime,
                                productId: productId as int,
                                customerId: customerId as int);
                            database.insertOrder(order);

                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Place'),
                      ),
                    )
                  ],
                ),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
