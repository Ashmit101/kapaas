import 'package:flutter/material.dart';

class CustomersForm extends StatefulWidget {
  const CustomersForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomersForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //Info correct
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
