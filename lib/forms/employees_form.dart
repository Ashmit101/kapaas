import 'package:flutter/material.dart';

class EmployeesForm extends StatefulWidget {
  const EmployeesForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmployeesFormState();
}

class _EmployeesFormState extends State<EmployeesForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Employee Data'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What is the employee\'s name?',
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
                icon: Icon(Icons.paid),
                hintText: 'How much is the salary?',
                label: Text('Salary'),
              ),
              controller: salaryController,
              keyboardType: TextInputType.phone,
              validator: (((value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a salary';
                } else if (double.parse(value) < 10000.00) {
                  return 'Salary must be at least 10000';
                }
                return null;
              })),
            ),
          ],
        ),
      ),
    );
  }
}
