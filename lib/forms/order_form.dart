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
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Choose a customer
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.person),
                            ),
                            Expanded(
                              child: DropdownButton<Customer>(
                                isExpanded: true,
                                alignment: Alignment.center,
                                value: dropdownValue,
                                // icon: const Icon(Icons.arrow_downward),
                                onChanged: (value) {
                                  print('Chosen customer : $value');
                                  setState(() {
                                    dropdownValue = value;
                                  });
                                  customerId = value?.id ?? 0;
                                },
                                hint: const Text('Customer'),
                                items: customers
                                    .map<DropdownMenuItem<Customer>>(
                                        (Customer value) {
                                  return DropdownMenuItem<Customer>(
                                    value: value,
                                    child: Text(value.name),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),

                        // Choose a product
                        Visibility(
                          visible: productId != null,
                          replacement: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                var id = await Navigator.pushNamed(
                                        context, '/products', arguments: true)
                                    as int?;
                                if (id != null) {
                                  print("Product chose : $id");
                                  productId = id;
                                  setState(() {
                                    productChosen = true;
                                  });
                                }
                              },
                              child: const Text('Choose Product'),
                            ),
                          ),
                          child: Card(
                            child: Container(
                              width: 400,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Selected Product',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(ProductHelper
                                                .getProductResourceFromID(
                                                    productId ?? 101)['imgUrl']
                                            as String),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Name: ',
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ProductHelper
                                                              .getProductResourceFromID(
                                                                  productId ??
                                                                      101)[
                                                          'title'] as String,
                                                      style: const TextStyle(
                                                          fontSize: 30),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'Price: ',
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ProductHelper
                                                              .getProductResourceFromID(
                                                                  productId ??
                                                                      101)[
                                                          'price'] as String,
                                                      style: const TextStyle(
                                                          fontSize: 30),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //Date Picker
                        Visibility(
                          visible: deadlinePicked,
                          replacement: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                var results =
                                    await showCalendarDatePicker2Dialog(
                                        context: context,
                                        config: config,
                                        dialogSize: const Size(325, 400));
                                if (results != null && results.isNotEmpty) {
                                  deadline = results[0];
                                  setState(() {
                                    deadlinePicked = true;
                                  });
                                }
                              },
                              child: const Text('Deadline'),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Deadline',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  Text(
                                    deadline
                                        .toString()
                                        .replaceAll('00:00:00.000', ''),
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                  ),
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
