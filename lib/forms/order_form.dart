import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/tables.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<KapaasDatabase>(context);

    var storedCustomersData = database.allCustomerEntries;

    Customer dropdownValue;

    int customerId;
    int productId;

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
                    DropdownButton<Customer>(
                      icon: const Icon(Icons.person),
                      onChanged: (value) {
                        setState(() {});
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          productId = await Navigator.pushNamed(
                              context, '/products',
                              arguments: true) as int;
                          print("Product chose : $productId");
                        },
                        child: const Text('Choose Product'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
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
