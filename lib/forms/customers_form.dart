import 'package:flutter/material.dart';
import 'package:kapaas/database/tables.dart';
import 'package:provider/provider.dart';

class CustomersForm extends StatefulWidget {
  const CustomersForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomersForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Customer Data'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What is the customer\'s name?',
                label: Text('Name'),
              ),
              controller: nameController,
              keyboardType: TextInputType.name,
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              }),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'What is the customer\'s phone number?',
                label: Text('Phone number'),
              ),
              controller: phoneController,
              keyboardType: TextInputType.phone,
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a contact number';
                } else if (value.length != 10 && value.length != 7) {
                  return 'Enter a valid phone number';
                }

                return null;
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final database =
                          Provider.of<KapaasDatabase>(context, listen: false);

                      //Info correct
                      var name = nameController.text;
                      var phone = phoneController.text;

                      final customer = Customer(name: name, phone: phone);
                      database.insertCustomer(customer);
                      goBackToListPage(context);
                    }
                  },
                  child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}

void goBackToListPage(BuildContext context) {
  Navigator.pop(context, true);
}
