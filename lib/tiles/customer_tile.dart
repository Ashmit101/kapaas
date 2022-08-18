import 'package:flutter/material.dart';
import 'package:kapaas/widgets/customer_details.dart';
import 'package:provider/provider.dart';
import '../database/tables.dart';

class CustomerTile extends StatelessWidget {
  final int id;
  final String name;
  final String contact;

  const CustomerTile(
      {super.key, required this.name, required this.contact, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: ((context) {
              return CustomerDetails(
                  customer: Customer(id: id, name: name, phone: contact));
            }));
      },
      child: Card(
        child: ListTile(
          leading: Text(id.toString()),
          title: Text(name),
          subtitle: Text(contact),
          trailing: PopupMenuButton<DatabaseOptions>(
            itemBuilder: (context) => <PopupMenuEntry<DatabaseOptions>>[
              const PopupMenuItem(
                value: DatabaseOptions.addmeasurement,
                child: Text('Add Measurement'),
              ),
              const PopupMenuItem(
                value: DatabaseOptions.delete,
                child: Text('Delete'),
              ),
              const PopupMenuItem(
                value: DatabaseOptions.edit,
                child: Text('Update'),
              )
            ],
            onSelected: (value) {
              final customer = Customer(name: name, phone: contact, id: id);
              final database =
                  Provider.of<KapaasDatabase>(context, listen: false);
              switch (value) {
                case DatabaseOptions.addmeasurement:
                  AddMeasurement(context, customer);
                  break;
                case DatabaseOptions.delete:
                  database.deleteCustomer(customer);
                  refreshCustomersList(context);
                  break;
                case DatabaseOptions.edit:
                  updateCustomer(context, customer);
                  break;
                default:
              }
            },
          ),
        ),
      ),
    );
  }

  void updateCustomer(BuildContext context, Customer customer) async {
    bool succeeded = await Navigator.pushNamed(context, '/customers/form',
        arguments: customer) as bool;
    if (succeeded) {
      refreshCustomersList(context);
    }
  }

  void AddMeasurement(BuildContext context, Customer customer) async {
    bool succeeded = await Navigator.pushNamed(
        context, '/customers/measurements/form',
        arguments: customer) as bool;
    if (succeeded) {
      refreshCustomersList(context);
    }
  }

  void refreshCustomersList(BuildContext context) {
    Navigator.popAndPushNamed(context, '/customers');
  }
}
