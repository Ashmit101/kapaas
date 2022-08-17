import 'package:calendar_date_picker2/calendar_date_picker2.dart';
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
    var config = CalendarDatePicker2WithActionButtonsConfig();

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
                    //Date Picker
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          var results = await showCalendarDatePicker2Dialog(
                              context: context,
                              config: config,
                              dialogSize: const Size(325, 400));
                          if (results != null && results.isNotEmpty) {
                            print("Results type : ${results.runtimeType}");
                            print(_getValueText(config.calendarType, results));
                          }
                        },
                        child: const Text('Deadline'),
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

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        var startDate = values[0].toString().replaceAll('00:00:00.000', '');
        var endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }
}
