import 'package:flutter/material.dart';
import 'package:kapaas/database/tables.dart';
import 'package:provider/provider.dart';

class MeasurementsForm extends StatefulWidget {
  const MeasurementsForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MeasurementsFormState();
}

class _MeasurementsFormState extends State<MeasurementsForm> {
  late int id;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController neckController = TextEditingController();
  final TextEditingController waistController = TextEditingController();
  final TextEditingController armController = TextEditingController();
  final TextEditingController hipController = TextEditingController();
  final TextEditingController wristController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customer = ModalRoute.of(context)!.settings.arguments as Customer;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Measurements'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Neck'),
                ),
                controller: neckController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the neck length';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Waist'),
                ),
                controller: waistController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the waist length';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Arm'),
                ),
                controller: armController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the arm length';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Hip'),
                ),
                controller: hipController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the hip length';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Wrist'),
                ),
                controller: wristController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the wrist length';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: (() {
                      if (_formKey.currentState!.validate()) {
                        // Inputs are valied
                        var neck = double.parse(neckController.text);
                        var waist = double.parse(waistController.text);
                        var arm = double.parse(armController.text);
                        var hip = double.parse(hipController.text);
                        var wrist = double.parse(wristController.text);

                        final database =
                            Provider.of<KapaasDatabase>(context, listen: false);

                        final measurement = Measurement(
                            customerId: customer.id as int,
                            neck: neck,
                            waist: waist,
                            arm: arm,
                            hip: hip,
                            wrist: wrist);
                        database.insertMeasurement(measurement);
                        goBackToCustomersList();
                      }
                    }),
                    child: const Text('Save')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goBackToCustomersList() {
    Navigator.pop(context, true);
  }
}
